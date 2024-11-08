;;; setup-lsp-mode.el --- Summary
;;; Commentary:
;;; Code:
(require 'lsp-mode)
(use-package lsp-mode
  :commands lsp
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c C-l")
  :hook ((clojure-mode . lsp))
  :config
  (setq lsp-headerline-breadcrumb-enable t
        lsp-lens-enable t
        lsp-signature-auto-activate nil
        ;; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
        lsp-enable-indentation nil)
  ;; (setq lsp-print-io t)
  (dolist (clojure-all-modes '(clojure-mode
                               clojurec-mode
                               clojurescript-mode
                               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,clojure-all-modes . "clojure"))))

(provide 'setup-lsp-mode)
;;; setup-lsp-mode.el ends here
