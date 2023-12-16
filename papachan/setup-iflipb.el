;;; setup-iflipb.el --- Summary
;;; Commentary:
;;; Code:

(use-package iflipb
  :pin melpa
  :ensure t
  :bind
  ("C-," . iflipb-next-buffer)
  ("C-." . iflipb-previous-buffer))

(provide 'setup-iflipb)
;;; setup-iflipb.el ends here
