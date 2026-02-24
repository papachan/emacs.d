;;; setup-font-system.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(progn
  ((lambda (font)
     (set-frame-font font)
     (set-face-attribute 'default nil
                         :font font
                         :height 120
                         :weight 'normal)
     (set-face-font 'default font))
   "Fira Code"))

(provide 'setup-font-system)
;;; setup-font-system.el ends here
