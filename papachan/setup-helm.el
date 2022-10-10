;;; setup-helm.el --- Summary
;;; Commentary:
;;; Code:

;; (use-package helm-projectile
;;   :ensure t
;;   :commands (helm-projectile helm-projectile-find-files helm-projectile-switch-project)
;;   :config (helm-projectile-on))

;; (use-package helm-ag
;;   :ensure t
;;   :bind ("C-x c M-g a" . helm-ag)
;;   :commands (helm-ag))

;; (use-package helm
;;   :ensure t
;;   :bind (("M-x" . #'helm-M-x)
;;          ("C-x C-f" . #'helm-find-files)
;;          ("C-x r b" . #'helm-filtered-bookmarks))
;;   :config
;;   (require 'helm-config)
;;   (setq helm-idle-delay 0.0
;;         helm-ff-skip-boring-files t
;;         helm-mode-fuzzy-match t
;;         helm-completion-in-region-fuzzy-match t
;;         helm-candidate-number-limit 100
;;         helm-display-buffer-reuse-frame t
;;         helm-display-buffer-width 80)
;;   (helm-mode t))

;; unset list-directory
;; (fmakunbound 'list-directory)

(provide 'setup-helm)
;;; setup-helm.el ends here
