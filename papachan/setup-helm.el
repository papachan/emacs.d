;;; setup-helm.el --- Summary
;;; Commentary:
;;; Code:

(use-package helm-projectile
  :ensure t
  :commands (helm-projectile helm-projectile-find-files helm-projectile-switch-project)
  :config (helm-projectile-on))

(use-package helm-ag
  :ensure t
  :bind ("M-g ." . helm-ag)
  :commands (helm-ag helm-projectile-ag))

(use-package helm-posframe
  :ensure t
  :init
  (add-hook 'helm-org-rifle-after-command-hook 'helm-posframe-cleanup)
  :custom
  (helm-posframe-height 15)
  (helm-posframe-width (round (* (frame-width) 1.15)))
  (helm-posframe-parameters '((left-fringe . 0)
                              (right-fringe . 0)
                              (internal-border-width . 12)))
  :config
   (setq helm-posframe-poshandler 'posframe-poshandler-frame-center))

(use-package helm
  :ensure t
  :bind (("M-x" . #'helm-M-x)
         ("C-x C-f" . #'helm-find-files)
         ("C-x r b" . #'helm-filtered-bookmarks))
  :config
  (require 'helm-config)
  (setq helm-idle-delay 0.0
        helm-ff-skip-boring-files t
        helm-mode-fuzzy-match t
        helm-completion-in-region-fuzzy-match t
        helm-candidate-number-limit 100
        helm-display-buffer-reuse-frame t
        helm-display-buffer-width 80)
  (helm-mode t)
  (helm-posframe-enable))

;; unset list-directory
(fmakunbound 'list-directory)

(provide 'setup-helm)
;;; setup-helm.el ends here
