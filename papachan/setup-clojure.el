;;; setup-clojure.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'rainbow-delimiters)

(use-package html-to-hiccup
  :ensure t
  ;; :bind (:map clojure-mode-map
  ;;             ("H-h" . html-to-hiccup-convert-region)
  ;;             ("H-y" . html-to-hiccup-yank))
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
                                 (clj-refactor-mode 1))))

(use-package clojurescript-mode
  :hook ((clojurescript-mode . paredit-mode)))

(use-package clojure-mode
  :ensure t
  :hook ((clojure-mode . paredit-mode)
         (clojure-mode . eldoc-mode)
         (clojure-mode . flycheck-mode)
         (clojure-mode . rainbow-delimiters-mode)
         (clojure-mode . display-line-numbers-mode))
  :init
  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.clje\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojurec-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode))
  :config
  (require 'flycheck-clj-kondo)
  (setq clojure-indent-style 'align-arguments
        clojure-align-forms-automatically t))

;; (use-package clojure-ts-mode
;;   :ensure t)

(provide 'setup-clojure)
;;; setup-clojure.el ends here
