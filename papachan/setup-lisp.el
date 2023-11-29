;;; setup-lisp.el --- Summary
;;; Commentary:
;;; Code:

(add-hook 'lisp-mode-hook #'enable-paredit-mode)

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
  :hook ((lisp-mode slime-repl-mode). enable-paredit-mode)
  :config
  (progn
    (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)))

(use-package slime-company
  :ensure t)

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program (executable-find "sbcl")
        slime-lisp-implementations
        '((sbcl ("/usr/bin/sbcl") :coding-system utf-8-unix))
        slime-net-coding-system 'utf-8-unix)
  :config
  (let ((helper-file (expand-file-name "~/quicklisp/slime-helper.el")))
    (if (file-exists-p helper-file)
        (load helper-file)
      (warn "(ql:quickload \"quicklisp-slime-helper\") must be run in quicklisp before")))
  (global-set-key (kbd "C-c C-q") 'slime-repl-quit)
  (slime-setup '(slime-company)))

(provide 'setup-lisp)
;;; setup-lisp.el ends here
