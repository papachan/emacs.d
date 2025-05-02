;;; setup-helm.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; unset list-directory
(fmakunbound 'list-directory)

(use-package helm
  :ensure t
  :bind (("M-x" . #'helm-M-x)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-x C-r" . helm-recentf))
  :config
  (setq helm-ff-skip-boring-files t
        helm-candidate-number-limit 100
        helm-display-buffer-reuse-frame t
        helm-display-buffer-width 80
        helm-split-window-inside-p t)
  (helm-mode t))

(use-package helm-ag
  :ensure t
  :bind ("C-x c M-g a" . #'helm-do-grep-ag)
  :commands (helm-ag))

(use-package swiper
  :ensure t)

;; swiper-helm have conflict with dired-sidebar
(use-package swiper-helm
  :ensure t
  :bind
  (("C-s" . swiper-helm)
   ("C-r" . swiper-helm))
  :config
  (require 'ivy))

(use-package helm-cider
  :ensure t
  :hook ((cider-mode . helm-cider-mode)))

(provide 'setup-helm)
;;; setup-helm.el ends here
