;;; setup-dired-sidebar.el
(require 'all-the-icons-dired)

(use-package dired-sidebar
  :ensure t
  :bind (("S-<f8>" . dired-sidebar-toggle-sidebar))
  :hook ((dired-mode . all-the-icons-dired-mode)
         (dired-sidebar-mode-hook . (lambda ()
                                      (tab-line-mode -1))))
  :config
  (add-hook 'dired-sidebar-mode-hook (lambda ()
                                        (tab-line-mode -1)))
  :commands (dired-sidebar-toggle-sidebar))

(provide 'setup-dired-sidebar)
;;; setup-dired-sidebar.el ends here
