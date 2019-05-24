;;; setup-dired-sidebar.el
(use-package dired-sidebar
  :bind (("<f8>" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

(provide 'setup-dired-sidebar)
;;; setup-dired-sidebar.el ends here
