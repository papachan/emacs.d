;;; setup-eshell.el
(use-package eshell
  :bind (("C-x e" . eshell))
  :config
  (progn
    (defun eshell-new ()
      (interactive)
      (eshell t))

    (defun eshell/clear ()
      "clear the eshell buffer"
      (interactive)
      (let ((inhibit-read-only t))
        (erase-buffer)))

    (global-set-key  (kbd "C-x E") 'eshell-new)
    (global-set-key  (kbd "C-l") 'eshell/clear))
  :init
  (setq eshell-mv-overwrite-files nil))

(provide 'setup-eshell)

;;; setup-eshell.el ends here
