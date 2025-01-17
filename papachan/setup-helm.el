;;; setup-helm.el --- Summary
;;; Commentary:
;;; Code:

;; unset list-directory
(fmakunbound 'list-directory)

(use-package helm-ag
  :ensure t
  :bind ("C-x c M-g a" . helm-ag)
  :commands (helm-ag))

(use-package helm
  :ensure t
  :bind (("C-x C-f" . helm-find-files))
  :config
  (setq helm-ff-skip-boring-files t
        helm-ff-skip-git-ignored-files t
        ;; helm-idle-delay 0.0
        ;; helm-mode-fuzzy-match t
        ;; helm-completion-in-region-fuzzy-match t
        helm-candidate-number-limit 100
        helm-display-buffer-reuse-frame t
        helm-display-buffer-width 80
        helm-split-window-inside-p t)
  (helm-mode t))

(use-package swiper
  :ensure t)

(use-package swiper-helm
  :ensure t
  :bind
  (("C-s" . swiper-helm)
   ("C-r" . swiper-helm)))

(provide 'setup-helm)
;;; setup-helm.el ends here
