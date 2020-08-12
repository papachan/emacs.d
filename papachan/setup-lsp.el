;;; setup-lsp.el --- lsp-mode
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :defer t
  :hook ((lisp-mode . lsp)
         (clojure-mode . lsp))
  :config
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp-deferred)

(provide 'setup-lsp)
;;; setup-lsp.el ends here
