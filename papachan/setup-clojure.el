;;; setup-clojure.el --- Summary
;;; Commentary:
;;; Code:
(require 'rainbow-delimiters)
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
                                 (cljr-add-keybindings-with-prefix "C-c C-m"))))

(use-package clojurescript-mode
  :hook ((clojurescript-mode . paredit-mode)
         (clojurescript-mode . (lambda () (auto-complete-mode -1)))))

(use-package clojure-mode
  :ensure t
  :hook ((clojure-mode . paredit-mode)
         (clojure-mode . eldoc-mode)
         (clojure-mode . flycheck-mode)
         (clojure-mode . rainbow-delimiters-mode)
         ;; (clojure-mode . (lambda () (auto-complete-mode -1)))
         )
  :init
  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.clje\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojurec-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode))
  :config
  (require 'flycheck-clj-kondo))

(add-hook 'clojure-mode-hook (lambda () (paredit-mode nil)))

(provide 'setup-clojure)
;;; setup-clojure.el ends here
