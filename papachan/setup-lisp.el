;;; setup-lisp.el --- Summary
;;; Commentary:
;;; Code:

(add-hook 'lisp-mode-hook #'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (paredit-mode +1)
                                  (company-mode +1)))

(let ((dir (locate-dominating-file invocation-directory "c:/Users/loaiz/quicklisp/HyperSpec/")))
  (if dir
      (progn
        (setq common-lisp-hyperspec-root (expand-file-name "c:/Users/loaiz/quicklisp/HyperSpec/" dir)))
    (warn "No HyperSpec directory found")))

(use-package slime-company
  :ensure t)

(use-package slime
  :init
  (setq inferior-lisp-program "sbcl"
        slime-lisp-implementations '((sbcl ("C:\\Program Files\\Steel Bank Common Lisp\\sbcl.exe"))))
  :config
  (global-set-key (kbd "C-c C-q") 'slime-repl-quit)
  (slime-setup '(slime-company)))

(provide 'setup-lisp)
;;; setup-lisp.el ends here
