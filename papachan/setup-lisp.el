;;; setup-lisp.el --- Summary
;;; Commentary:
;;; Code:

(add-hook 'lisp-mode-hook #'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (paredit-mode +1)
                                  (company-mode +1)))

(use-package slime
  :init
  (setq inferior-lisp-program "sbcl"
        slime-lisp-implementations '((sbcl ("C:\\Program Files\\Steel Bank Common Lisp\\sbcl.exe"))))
  :config
  (global-set-key (kbd "C-c C-q") 'slime-repl-quit)
  (slime-setup))

(provide 'setup-lisp)
;;; setup-lisp.el ends here
