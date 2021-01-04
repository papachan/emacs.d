;;; Appearance --- load emacs theme here
;;
(require 'zerodark-theme)

(progn
  ((lambda (font)
     (set-frame-font font)
     (set-face-attribute 'default nil
                         :font font
                         :height 102
                         :weight 'normal)
     (set-face-font 'default font))
   "JetBrains Mono"))

(load-theme 'zerodark t)
(zerodark-setup-modeline-format)

(provide 'appearance)
;;; appearance.el ends here
