;;; setup-font-system.el --- -*- lexical-binding: nil; -*-
;;; Commentary:
;;; Code:

(progn
  ((lambda (font)
     (set-frame-font font)
     (set-face-attribute 'default nil
                         :font font
                         :height 110
                         :weight 'normal)
     (set-face-font 'default font))
   "FiraMonoNerdFont"))

(provide 'setup-font-system)
;;; setup-font-system.el ends here