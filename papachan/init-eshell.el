;;; init-eshell.el

(defun eshell-new ()
  (interactive)
  (eshell t))


(global-set-key  (kbd "C-x e") 'eshell)
(global-set-key  (kbd "C-x E") 'eshell-new)

(progn
  (setq eshell-directory-name (expand-file-name "eshell"  dotemacs-cache-dir))
  (setq eshell-aliases-file (expand-file-name "eshell/alias" dotemacs-dir))
  )

(provide 'init-eshell)

;;; init-eshell.el ends here
