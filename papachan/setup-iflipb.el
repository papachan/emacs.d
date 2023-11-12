;;; setup-iflipb.el --- Summary
;;; Commentary:
;;; Code:


(use-package iflipb
  :ensure t
  :bind
  ("<f8>" . iflipb-next-buffer)
  ("<f7>" . iflipb-previous-buffer))


(provide 'setup-iflipb)
;;; setup-iflipb.el ends here
