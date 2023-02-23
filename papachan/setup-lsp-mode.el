;;; setup-lsp-mode.el --- Summary
;;; Commentary:
;;; Code:
(require 'lsp-mode)
(use-package lsp-mode
  :commands lsp
  :hook ((clojure-mode . lsp)
         (dart-mode . lsp)
         (java-mode . lsp))
  :config
  (setq lsp-headerline-breadcrumb-enable t
        lsp-lens-enable t
        lsp-signature-auto-activate nil)
  (dolist (clojure-all-modes '(clojure-mode
                               clojurec-mode
                               clojurescript-mode
                               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,clojure-all-modes . "clojure"))))

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-c C-l")

(provide 'setup-lsp-mode)
;;; setup-lsp-mode.el ends here
