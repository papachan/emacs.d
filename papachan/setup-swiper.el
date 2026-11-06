;;; setup-swiper.el --- Summary. -*- lexical-binding: nil; -*-
;;; Commentary:

;;; Code:
;; ivy-mode
(use-package ivy
  :ensure t
  :custom
  (enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(provide 'setup-swiper)
;;; setup-swiper.el ends here