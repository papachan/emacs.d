;;; setup-eshell.el --- Summary
;;; Commentary:

;;; Code:
(defun eshell-new ()
  (interactive)
  (eshell t))

(use-package eshell
  :bind (("C-x t e" . eshell)
         ("C-x t E" . eshell-new)))

(provide 'setup-eshell)
;;; setup-eshell.el ends here
