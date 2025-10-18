;;; setup-dired-sidebar.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;

;;; Code:

(require 'all-the-icons-dired)

(use-package dired-sidebar
  :ensure t
  :bind (("S-<f8>" . dired-sidebar-toggle-sidebar)) ;; fn Shift <f8> in mac
  :hook ((dired-mode . all-the-icons-dired-mode)
         (dired-sidebar-mode-hook . (lambda ()
                                      (tab-line-mode -1))))
  :config
  (add-hook 'dired-sidebar-mode-hook (lambda ()
                                       (tab-line-mode -1)))
  :commands (dired-sidebar-toggle-sidebar))

(use-package dired-hide-dotfiles
  :hook (dired-sidebar-mode . dired-hide-dotfiles-mode)
  :bind (:map dired-sidebar-mode-map
              ("H" . dired-hide-dotfiles-mode)))

(provide 'setup-dired-sidebar)
;;; setup-dired-sidebar.el ends here
