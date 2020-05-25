;;; setup-cider.el
;; clojure setup

;; Clojure IDE and REPL for Emacs
;; autocompletion
(require 'company)

(use-package cider
  :ensure t
  :defer t
  :bind (:map cider-repl-mode-map
              ("C-X sc" . cider-repl-clear-buffer))
  :config
  (setq ;; result prefix for the REPL
        cider-repl-result-prefix ";; => "
        ;; display cider repl in the current window
        cider-repl-display-in-current-window t
        ;; set helper message to false
        cider-repl-display-help-banner nil
        ;; error buffer not popping up
        cider-show-error-buffer nil
        ;; looong history
        cider-repl-history-size 3000
        ;; never ending REPL history
        cider-repl-wrap-history t
        ;; nice pretty printing
        cider-repl-use-pretty-printing t
        ;; weird issues with highlighting code, highlight all branches of reader conditionals
        cider-font-lock-reader-conditionals nil
        ;; nrepl log messages
        nrepl-log-messages t)
  (cider-repl-toggle-pretty-printing)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'paredit-mode)
  ;; company
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))

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
                                 (yas-minor-mode 1)
                                 (cljr-add-keybindings-with-prefix "C-c C-m"))))

(use-package helm-cider
  :ensure t
  :hook ((cider-mode . helm-cider-mode)))

(use-package clojure-mode
  :ensure t
  :hook ((clojure-mode . paredit-mode)
         (clojure-mode . eldoc-mode))
  :init
  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.clje\\'" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojurec-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode)))

(provide 'setup-cider)
;;; setup-cider.el ends here
