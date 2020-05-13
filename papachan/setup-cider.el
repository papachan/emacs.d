;;; setup-cider.el
;; clojure setup

;; Clojure IDE and REPL for Emacs
(require 'cider)
(require 'clj-refactor)
(require 'flycheck-clj-kondo)
(require 'helm-cider)
;; autocompletion
(require 'company)

(use-package cider
  :bind (:map cider-repl-mode-map ("C-X sc" . cider-repl-clear-buffer))
  :config
  (progn
    (setq cljr-suppress-middleware-warnings t)))

(use-package flycheck-clj-kondo
  :ensure t)

(use-package clj-refactor
  :ensure t
  :config (progn (setq cljr-suppress-middleware-warnings t)
                 (setq cljr-warn-on-eval nil)
                 (setq cljr-eagerly-build-asts-on-startup nil)
                 (add-hook 'clojure-mode-hook (lambda ()
                        (clj-refactor-mode 1)
                        (cljr-add-keybindings-with-prefix "C-c C-m")))))

(use-package helm-cider
  :hook ((cider-mode . helm-cider-mode)))

(add-hook 'clojure-mode-hook 'paredit-mode)

(provide 'setup-cider)
;;; setup-cider.el ends here
