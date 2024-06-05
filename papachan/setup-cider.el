;;; setup-cider.el --- Summary
;;; Commentary:
;;; Cider setup
;;; Clojure IDE and REPL for Emacs

;;; Code:
(require 'company)

(use-package cider
  :ensure t
  :defer t
  :after clojure-mode
  :commands (cider-jack-in cider-jack-in-clojurescript)
  :bind (("C-c M-j" . cider-jack-in)
         ("C-c C-a" . cider-eval-print-last-sexp)
         (:map cider-repl-mode-map
               ("C-X sc" . cider-repl-clear-buffer))
         (:map cider-repl-mode-map
               ("C-c C-x" . cider-ns-refresh))
         (:map cider-repl-mode-map
               ("RET" . cider-repl-newline-and-indent))
         (:map cider-repl-mode-map
               ("C-<return>" . cider-repl-return)))
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
   nrepl-log-messages t
   ;; Hide *nrepl-connection* and *nrepl-server* buffers from appearing
   ;; in some buffer switching commands like switch-to-buffer
   nrepl-hide-special-buffers nil)
  (cider-add-to-alist 'cider-jack-in-dependencies "refactor-nrepl/refactor-nrepl" "3.10.0")
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook (lambda ()
                                    (cider-repl-toggle-pretty-printing)
                                    (tab-line-mode -1)))
  :hook
  (cider-repl-mode . paredit-mode)
  (cider-repl-mode . company-mode))

(provide 'setup-cider)
;;; setup-cider.el ends here
