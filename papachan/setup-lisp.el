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
  :hook ((lisp-mode slime-repl-mode). enable-paredit-mode)
  :config
  (progn
    (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)))


(use-package slime-company
  :ensure t)

(use-package slime
  :ensure t
  :init (progn (setq slime-contribs '(slime-fancy)
                     inferior-lisp-program (if (eq system-type 'darwin)
                                               "/usr/local/bin/sbcl"
                                             "sbcl")
                     slime-lisp-implementations
                     '((sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix))
                     slime-net-coding-system 'utf-8-unix))
  :config (progn
            (let ((helper-file (expand-file-name "~/.local/opt/quicklisp/slime-helper.el")))
              (if (file-exists-p helper-file)
                  (load helper-file)
                (warn "(ql:quickload \"quicklisp-slime-helper\") must be run in quicklisp before")))
            (slime-setup '(slime-company))
            (global-set-key (kbd "C-c C-q") 'slime-repl-quit)
            (global-set-key (kbd "C-c s") 'slime-selector)))

(provide 'setup-lisp)
;; setup-lisp.el ends here
