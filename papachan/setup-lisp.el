;;; setup-lisp.el
;;
(require 'slime)
(require 'slime-company)

(use-package lisp-mode
  :mode (("\\.lisp'" . lisp-mode)
         ("\\.lsp'" . lisp-mode)
         ("\\.cl'" . lisp-mode)
         ("\\.asd'" . lisp-mode)
         ("\\.fasl'" . lisp-mode)))

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


(defun hook-lisp-mode ()
  "Display lambda as λ"
  (global-prettify-symbols-mode 1))

;; (add-hook 'lisp-mode-hook #'hook-lisp-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook #'enable-paredit-mode)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(custom-set-variables '(safe-local-variable-values (quote ((Syntax . Common-Lisp)))))

(provide 'setup-lisp)
;; setup-lisp.el ends here
