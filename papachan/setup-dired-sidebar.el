;;; setup-dired-sidebar.el
(use-package dired-sidebar
  :ensure t
  :bind (("S-<f8>" . dired-sidebar-toggle-sidebar))
  :commands (dired-sidebar-toggle-sidebar))

(provide 'setup-dired-sidebar)
;;; setup-dired-sidebar.el ends here
