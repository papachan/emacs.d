;;; setup-ivy.el --- Summary
;;; Commentary:
;;; Code:
(use-package ivy
  :bind (("C-c C-r" . ivy-resume)
         ("<f6>" . ivy-resume))
  :init (setq ivy-use-virtual-buffers t
              enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(require 'swiper)
(global-set-key "\C-s" 'swiper)
(global-set-key "\C-r" 'swiper)
(provide 'setup-ivy)
;;; setup-ivy.el ends here
