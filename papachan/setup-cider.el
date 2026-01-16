;;; setup-cider.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Cider setup
;;; Clojure IDE and REPL for Emacs
;;; Code:
(use-package company :ensure t)

;; (defun clerk-show ()
;;   (interactive)
;;   (when-let
;;       ((filename
;;         (buffer-file-name)))
;;     (save-buffer)
;;     (cider-interactive-eval
;;      (concat "(nextjournal.clerk/show! \"" filename "\")"))))

(defun open-portal ()
  (interactive)
  (cider-interactive-eval
   "(require '[portal.api :as p])
     (do
       (def p (p/open))
       (add-tap #'p/submit))"))

(defun my/kill-dead-repls ()
  "Kill all dead REPL buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (when (and (string-match "\\*cider-repl" (buffer-name buffer))
               (with-current-buffer buffer
                 (not (process-live-p (get-buffer-process buffer)))))
      (kill-buffer buffer))))

(use-package cider
  :ensure t
  :defer t
  :after clojure-mode
  :commands (cider-mode cider-connect cider-jack-in)
  :bind (("C-c M-j" . cider-jack-in)
         ("C-c C-a" . cider-eval-print-last-sexp)
         ("C-M-g"   . open-portal)
         (:map cider-repl-mode-map
               ("C-X sc" . cider-repl-clear-buffer))
         (:map cider-repl-mode-map
               ("C-c C-x" . cider-ns-refresh))
         (:map cider-repl-mode-map
               ("RET" . cider-repl-newline-and-indent))
         (:map cider-repl-mode-map
               ("C-<return>" . cider-repl-return)))
  :config
  (setq
   ;; result prefix for the REPL
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
   ;; disable auto-complete
   cider-completion-display-context nil
   ;; disable popup asking to connect to a dead repl
   cider-repl-auto-detect-type t
   cider-auto-select-error-buffer nil)

  :hook
  (cider-mode . eldoc-mode)
  (cider-mode . company-mode)
  (cider-repl-mode . paredit-mode)
  (cider-repl-mode . company-mode)
  (cider-repl-mode . eldoc-mode)
  (cider-repl-mode . (lambda ()
                       (cider-repl-toggle-pretty-printing)
                       (tab-line-mode -1)
                       (helm-cider-mode 1)))
  (cider-connected-hook . my/kill-dead-repls))

(use-package kaocha-runner
  :after (cider-mode)
  :bind (:map clojure-mode-map
              ("C-c k t" . kaocha-runner-run-test-at-point)
              ("C-c k r" . kaocha-runner-run-tests)
              ("C-c k a" . kaocha-runner-run-all-tests)
              ("C-c k w" . kaocha-runner-show-warnings)
              ("C-c k h" . kaocha-runner-hide-windows)))

(use-package helm-cider
  :ensure t
  :hook ((cider-mode . helm-cider-mode)))

(provide 'setup-cider)
;;; setup-cider.el ends here
