;;; setup-lisp.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package paredit
  :ensure t
  :pin "melpa"
  :bind (:map paredit-mode-map
              ("M-)" . paredit-forward-slurp-sexp)
              ("M-(" . paredit-forward-barf-sexp)))

(use-package lisp-mode
  :mode (("\\.el'" . lisp-mode)
         ("\\.lisp'" . lisp-mode)
         ("\\.lsp'" . lisp-mode)
         ("\\.cl'" . lisp-mode)
         ("\\.asd'" . lisp-mode)
         ("\\.fasl'" . lisp-mode))
  :hook ((lisp-mode slime-repl-mode). enable-paredit-mode))

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (setq display-line-numbers 'relative)))

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)

(provide 'setup-lisp)
;;; setup-lisp.el ends here
