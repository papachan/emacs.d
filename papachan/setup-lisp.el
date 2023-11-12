;;; setup-lisp.el --- Summary
;;; Commentary:
;;; Code:


(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (paredit-mode +1)
                                  (company-mode +1)))

(provide 'setup-lisp)
;;; setup-lisp.el ends here
