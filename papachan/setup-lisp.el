;;; setup-lisp.el --- Summary
;;; Commentary:
;;; Code:
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(use-package paredit
  :ensure t
  :pin "melpa"
  :bind (:map paredit-mode-map
              ("M-)" . paredit-forward-slurp-sexp)
              ("M-(" . paredit-forward-barf-sexp)))

(provide 'setup-lisp)
;;; setup-lisp.el ends here
