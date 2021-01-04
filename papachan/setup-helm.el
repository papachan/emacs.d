;;; setup-helm.el --- Summary
;;; Commentary:
;;; Code:
;; (require 'helm-projectile)
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
  (helm-mode t))

(use-package helm-cider
  :ensure t
  :hook ((cider-mode . helm-cider-mode)))

;; (setq helm-projectile-fuzzy-match nil)
;; (helm-projectile-on)

(provide 'setup-helm)
;;; setup-helm.el ends here
