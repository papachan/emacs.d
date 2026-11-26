;;; setup-dired-sidebar.el --- Summary. -*- lexical-binding: nil; -*-
;;; Commentary:

;;; Code:

(use-package expui-icons
  :vc (:url "https://github.com/papachan/expui-icons.git"
       :rev "0f824e18bb023193d2ee8d0579b55f99117c266d"))

(use-package dired-sidebar
  :ensure t
  :bind (("S-<f8>" . dired-sidebar-toggle-sidebar))
  :hook ((dired-sidebar-mode . expui-icons-dired-mode))
  :init
  ;; 'none so dired-sidebar doesn't also turn on all-the-icons-dired
  (setq dired-sidebar-theme 'none)
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