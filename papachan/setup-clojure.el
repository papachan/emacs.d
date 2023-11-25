;;; setup-clojure.el --- Summary
;;; Commentary:
;;; Code:

(require 'rainbow-delimiters)
(use-package flycheck-clj-kondo
  :ensure t)

(use-package html-to-hiccup
  :ensure t
  :config
  (setq html-to-hiccup-use-shorthand-p t))

(use-package clojure-mode
  :ensure t
  :hook ((clojure-mode . paredit-mode)
         (clojure-mode . eldoc-mode)
         (clojure-mode . flycheck-mode)
         (clojure-mode . rainbow-delimiters-mode)
         (clojure-mode . company-mode))
  ;; (clojure-mode . (lambda () (auto-complete-mode -1)))
  :init
  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.clje\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojurec-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode))
  :config
  (require 'flycheck-clj-kondo)
  ;; indentation
  (setq clojure-indent-style 'align-arguments
        clojure-align-forms-automatically t))

(use-package parseedn
  :ensure t)

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
