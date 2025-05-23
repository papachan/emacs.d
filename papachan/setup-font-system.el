;;; setup-font-system.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(progn
  ((lambda (font)
     (set-frame-font font)
     (set-face-attribute 'default nil
                         :font font
                         :height 130
                         :weight 'normal)
     (set-face-font 'default font))
   "JetBrains Mono"))

(provide 'setup-font-system)
;;; setup-font-system.el ends here
