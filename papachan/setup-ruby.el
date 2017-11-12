;;; setup-ruby.el
(require 'smartparens-config)
(require 'smartparens-ruby)
(require 'compile)
(require 'inf-ruby)

;; Trick founded from EndlessParentheses
;; to launch ruby as cider repl
;; http://endlessparentheses.com/turbo-up-your-ruby-console-in-emacs.html
(defcustom ruby-extensions-file
  "../console_extensions.rb"
  "File loaded when a ruby console is started.
Name is relative to the project root.")

(defun launch-ruby ()
  (interactive)
  (let ((default-directory (projectile-project-root))
        (was-running (get-buffer-process inf-ruby-buffer)))
    ;; Skip annoying ENV prompt in case of rails.
    (cl-letf (((symbol-function 'inf-ruby-console-rails-env)
               (lambda () "development")))
      (inf-ruby-console-auto))
    (when (and (not was-running)
               (get-buffer-process (current-buffer))
               (file-readable-p ruby-extensions-file))
      ;; If this brand new buffer has lots of lines then
      ;; some exception probably happened.
      (send-string
       (get-buffer-process (current-buffer))
       (concat "require '" ruby-extensions-file
               "'\n")))))

(defun rspec-compile-file ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s -l %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   (line-number-at-pos)) t))

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)

(add-to-list 'auto-mode-alist
               '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))

(add-to-list 'auto-mode-alist
               '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")

(smartparens-global-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))

;; ROBE
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; COMPANY
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; enh-ruby-mode
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)
(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c l") 'rspec-compile-on-line)
            (local-set-key (kbd "C-c k") 'rspec-compile-file)))

;; AUTOCOMPLETE
(add-to-list 'ac-modes 'inf-ruby-mode)
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
;; Optionally bind auto-complete to TAB in inf-ruby buffers:
(eval-after-load 'inf-ruby'
  '(progn
     '(define-key ruby-mode-map (kbd "C-c M-j") 'launch-ruby)
     '(define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete)))

(provide 'setup-ruby)
;;; setup-ruby.el ends here
