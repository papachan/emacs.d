;;; setup-dired-sidebar.el --- Summary
;;; Commentary:
;;; Code:
(require 'all-the-icons-dired)

(use-package dired-sidebar
  :ensure t
  :bind (("S-<f8>" . dired-sidebar-toggle-sidebar))
  :hook ((dired-mode . all-the-icons-dired-mode))
  :commands (dired-sidebar-toggle-sidebar))

(use-package dired
  :hook ((dired-mode . all-the-icons-dired-mode)))

(provide 'setup-dired-sidebar)
;;; setup-dired-sidebar.el ends here
