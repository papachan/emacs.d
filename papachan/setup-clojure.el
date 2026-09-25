;;; setup-clojure.el --- Summary. -*- lexical-binding: nil; -*-
;;; Commentary:
;;; Code:

(use-package rainbow-delimiters :ensure t)

(use-package flycheck-clj-kondo :ensure t)

(defun clojure-grep-app-search-symbol-at-point ()
  "Search grep.app for the Clojure symbol at point in a browser.
Results are restricted to Clojure via `f.lang=Clojure&f.lang.pattern=clojure'."
  (interactive)
  (let ((symbol (thing-at-point 'symbol t)))
    (unless symbol
      (user-error "No symbol at point"))
    (browse-url
     (concat "https://grep.app/search?f.lang=Clojure&f.lang.pattern=clojure&q="
             (url-hexify-string symbol)))))

(defun clojure-delete-backward-inner ()
  "Delete from point back to the start of the enclosing form's content.
Works like `change-inner' but only backward: everything between the
opening delimiter of the innermost enclosing list, vector, map, set or
string and point is deleted, leaving the delimiter itself.
Nothing is added to the kill ring."
  (interactive "*")
  (let* ((ppss (syntax-ppss))
         (start (cond ((nth 3 ppss) (1+ (nth 8 ppss))) ; inside a string
                      ((nth 4 ppss) nil)               ; inside a comment
                      ((nth 1 ppss) (1+ (nth 1 ppss)))))) ; innermost open paren
    (cond ((null start) (call-interactively #'backward-kill-word))
          ((< start (point)) (delete-region start (point)))
          (t (message "Nothing to delete before point in this form")))))

(use-package clojure-mode
  :ensure t
  :hook ((clojure-mode . paredit-mode)
         (clojure-mode . eldoc-mode)
         (clojure-mode . flycheck-mode)
         (clojure-mode . rainbow-delimiters-mode)
         (clojure-mode . company-mode))
  :mode (("\\.edn$" . edn-mode)
         ("\\.cljs$" . clojurescript-mode)
         ("\\.cljx$" . clojurex-mode)
         ("\\.cljc$" . clojurec-mode))
  :config
  (require 'flycheck-clj-kondo)
  (require 'clojure-mode-extra-font-locking)
  ;; indentation
  (setq clojure-indent-style 'align-arguments
        clojure-align-forms-automatically t)
  (define-key clojure-mode-map (kbd "C-c g") 'clojure-grep-app-search-symbol-at-point)
  ;; replaces the default C-<backspace> (backward-kill-word) in Clojure mode.
  (define-key clojure-mode-map (kbd "C-<backspace>") 'clojure-delete-backward-inner))

;; (use-package parseedn :ensure t)

(use-package clojurescript-mode
  :hook ((clojurescript-mode . paredit-mode)
         (clojurescript-mode . company-mode)))
;; (clojurescript-mode . (lambda () (auto-complete-mode -1)))

(use-package clj-refactor
  :ensure t
  :hook (clojure-mode . clj-refactor-mode)
  :init
  (setq cljr-suppress-middleware-warnings t)
  (setq cljr-warn-on-eval nil)
  (setq cljr-eagerly-build-asts-on-startup nil)
  :config
  (add-hook 'clojure-mode-hook (lambda ()
                                 (clj-refactor-mode 1)
                                 (yas-minor-mode 1)
                                 (cljr-add-keybindings-with-prefix "C-c C-m"))))

(provide 'setup-clojure)
;;; setup-clojure.el ends here