;;; setup-dired-sidebar.el --- Summary
;;; Commentary:
;;; Code:

(require 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(use-package dired-sidebar
  :ensure t
  :bind (("S-<f8>" . dired-sidebar-toggle-sidebar))
  :hook ((dired-sidebar-mode-hook . (lambda ()
                                      (tab-line-mode -1))))
  :config
  (add-hook 'dired-sidebar-mode-hook (lambda ()
                                       (tab-line-mode -1)))
  :commands (dired-sidebar-toggle-sidebar))

(provide 'setup-dired-sidebar)
;;; setup-dired-sidebar.el ends here
