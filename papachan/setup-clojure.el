;;; setup-clojure.el --- -*- lexical-binding: nil; -*-
;;; Commentary:
;;; Code:
(require 'rainbow-delimiters)

(use-package html-to-hiccup
  :ensure t
  :bind (:map clojure-mode-map
              ("H-h" . html-to-hiccup-convert-region)
              ("H-y" . html-to-hiccup-yank))
  :config
  (setq html-to-hiccup-use-shorthand-p t))

(use-package anakondo
  :ensure t
  :commands anakondo-minor-mode
  :init
  (require 'projectile))

(use-package flycheck-clj-kondo
  :ensure t)

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
                                 ;; (cljr-add-keybindings-with-prefix "C-c C-m")
                                 )))

(use-package clojurescript-mode
  :hook ((clojurescript-mode . paredit-mode)))

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

(use-package clojure-mode
  :ensure t
  :hook ((clojure-mode . paredit-mode)
         (clojure-mode . eldoc-mode)
         (clojure-mode . flycheck-mode)
         (clojure-mode . rainbow-delimiters-mode))
  :init
  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.clje\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojurec-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode))
  :config
  (require 'flycheck-clj-kondo)
  (add-hook 'clojure-mode-hook (lambda () (paredit-mode nil)))
  (define-key clojure-mode-map (kbd "C-c g") 'clojure-grep-app-search-symbol-at-point))

;; (use-package clojure-ts-mode
;;   :ensure t)

(provide 'setup-clojure)
;;; setup-clojure.el ends here
