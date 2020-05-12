;;; setup-lisp.el
;;
(require 'slime)

(use-package lisp-mode
  :mode (("\\.el'" . lisp-mode)
         ("\\.lisp'" . lisp-mode)
         ("\\.lsp'" . lisp-mode)
         ("\\.cl'" . lisp-mode)
         ("\\.asd'" . lisp-mode)
         ("\\.fasl'" . lisp-mode))
  :hook ((lisp-mode slime-repl-mode). enable-paredit-mode))

(provide 'setup-lisp)
;; setup-lisp.el ends here
