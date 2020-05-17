;;; setup-cider.el
;; clojure setup

;; Clojure IDE and REPL for Emacs
;; autocompletion
(require 'company)

(use-package cider
  :ensure t
  :bind (:map cider-repl-mode-map ("C-X sc" . cider-repl-clear-buffer))
  :config
  (progn
    ;; result prefix for the REPL
    (setq cider-repl-result-prefix ";; => ")
    ;; display cider repl in the current window
    (setq cider-repl-display-in-current-window t)
    ;; set helper message to false
    (setq cider-repl-display-help-banner nil)
    ;; error buffer not popping up
    (setq cider-show-error-buffer nil)
    ;; looong history
    (setq cider-repl-history-size 3000)
    ;; never ending REPL history
    (setq cider-repl-wrap-history t)
    ;; nice pretty printing
    (setq cider-repl-use-pretty-printing t)))

(use-package anakondo
  :ensure t)

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
  :ensure t
  :hook ((cider-mode . helm-cider-mode)))

(use-package clojure-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
    (add-to-list 'auto-mode-alist '("\\.clje\\'" . clojure-mode))
    (add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojurec-mode))
    (add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode)))
  :hook ((clojure-mode . paredit-mode)))

(provide 'setup-cider)
;;; setup-cider.el ends here
