;;; setup-dired-sidebar.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;

;;; Code:

(require 'all-the-icons-dired)

(use-package dired-sidebar
  :ensure t
  :bind (("S-<f8>" . dired-sidebar-toggle-sidebar))
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)
  :commands (dired-sidebar-toggle-sidebar))

;; dired-subtree gives the actual tree-expand behavior
(use-package dired-subtree
  :ensure t
  :after dired
  :bind (:map dired-mode-map
              ("<tab>" . dired-subtree-toggle)
              ("TAB"   . dired-subtree-toggle)
              ("<backtab>" . dired-subtree-cycle)))


(provide 'setup-dired-sidebar)
;;; setup-dired-sidebar.el ends here
