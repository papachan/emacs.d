;;; setup-helm.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; unset list-directory
(fmakunbound 'list-directory)

(defun helm-grep-symbol-at-point-in-project ()
  (interactive)
  (let* ((symbol (thing-at-point 'symbol t))
         (project-root (or (and (fboundp 'projectile-project-root)
                                (projectile-project-root))
                           (and (fboundp 'project-root)
                                (project-current)
                                (project-root (project-current)))
                           default-directory)))
    (if symbol
        (let ((default-directory project-root))
          (helm-do-grep-ag nil))
      (message "No symbol at point"))))

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
        helm-split-window-inside-p t
        helm-display-line-numbers-mode nil)
  (helm-mode t))

(use-package helm-ag
  :ensure t
  :custom
  (helm-ag-base-command
   "rg -S --no-heading --smart-case --color=never --line-number --max-columns 400")
  :bind ("C-x c M-g a" . #'helm-do-grep-ag))

(use-package swiper
  :ensure t)

;; swiper-helm have conflict with dired-sidebar
(use-package swiper-helm
  :ensure t
  :bind
  (("C-s" . my/swiper-search-without-line-numbers)
   ("C-r" . my/swiper-search-without-line-numbers))
  :config
  (defun my/swiper-search-without-line-numbers ()
    (interactive)
    (let ((old-display-line-numbers display-line-numbers))
      (setq display-line-numbers nil)
      (unwind-protect
          (swiper)
        (setq display-line-numbers old-display-line-numbers))))
  (setq swiper-helm-display-function 'display-buffer)
  (require 'ivy))

(use-package helm-cider
  :ensure t
  :hook ((cider-mode . helm-cider-mode)))

(provide 'setup-helm)
;;; setup-helm.el ends here
