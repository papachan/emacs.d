;;; setup-iflipb.el --- Summary
;;; Commentary:
;;; Code:

(use-package iflipb
  :ensure t
  :bind
  ("C-," . iflipb-next-buffer)
  ("C-." . iflipb-previous-buffer))

(provide 'setup-iflipb)
;;; setup-iflipb.el ends here
