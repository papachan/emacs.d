;;; setup-ruby.el
(require 'smartparens-config)
(require 'smartparens-ruby)
(require 'compile)

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

;; PROJECTILE
(projectile-global-mode)
(setq projectile-enable-caching t)

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
  '(define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))


(provide 'setup-ruby)
;;; setup-ruby.el ends here
