;;; setup-lsp-mode.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'lsp)
  (add-hook 'clojurescript-mode-hook #'lsp)
  (add-hook 'clojurec-mode-hook #'lsp)
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c C-l")

  :config
  (setq lsp-headerline-breadcrumb-enable t
        lsp-inhibit-message t
        lsp-ui-sideline-enable t
        lsp-ui-doc-enable nil
        lsp-lens-enable t
        lsp-signature-auto-activate nil
        lsp-enable-indentation nil
        lsp-ui-sideline-show-flycheck t
        lsp-ui-flycheck-live-reporting t
        lsp-highlight-symbol-at-point t
        company-minimum-prefix-length 1)
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
