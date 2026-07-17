;;; setup-lsp-mode.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands lsp
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c C-l")
  :hook ((clojure-mode . lsp)
         (clojurescript-mode . lsp))
  :custom
  (lsp-diagnostics-provider :flycheck)
  :config
  (setq lsp-headerline-breadcrumb-enable t
        lsp-lens-enable t
        lsp-signature-auto-activate nil
        lsp-inhibit-message t
        lsp-ui-sideline-enable t
        lsp-ui-doc-enable nil
        lsp-ui-sideline-show-flycheck t
        lsp-ui-flycheck-live-reporting t
        lsp-highlight-symbol-at-point t
        company-minimum-prefix-length 1
        ;; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
        lsp-enable-indentation nil)
  ;; (setq lsp-print-io t)
  (dolist (clojure-all-modes '(clojure-mode
                               clojurec-mode
                               clojurescript-mode
                               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,clojure-all-modes . "clojure"))))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-enable nil))

(provide 'setup-lsp-mode)
;;; setup-lsp-mode.el ends here
