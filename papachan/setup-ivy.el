;;; setup-ivy.el --- -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; ivy-mode
(use-package ivy
  :ensure t
  :bind (("C-c C-r" . ivy-resume)
         ("<f6>" . ivy-resume))
  :init (setq ivy-use-virtual-buffers t
              enable-recursive-minibuffers t)
        ;; enable this if you want `swiper' to use it
        ;; (setq search-default-mode #'char-fold-to-regexp)
  :config
  (ivy-mode 1))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(provide 'setup-ivy)
;;; setup-ivy.el ends here
