;;; setup-iflipb.el --- Summary. -*- lexical-binding: nil; -*-
;;; Commentary:
;;; Code:

(use-package iflipb
  :vc (:url "https://github.com/jrosdahl/iflipb" :rev :newest)
  :bind
  ("C-c <left>" . iflipb-next-buffer)
  ("C-c <right>" . iflipb-previous-buffer))

(provide 'setup-iflipb)
;;; setup-iflipb.el ends here
