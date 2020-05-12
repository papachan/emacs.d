;;; personal.el
;;
(cond
 ((eq system-type 'gnu/linux)
  (progn
    ((lambda (font)
       (set-frame-font font)
       (set-face-attribute 'default nil
                           :font font
                           :height 120
                           :weight 'normal)
       (set-face-font 'default font))
     "Ubuntu Mono")))
 ((eq system-type 'darwin)
  (progn
    ((lambda (font)
       (set-frame-font font)
       (set-face-attribute 'default nil
                           :font font
                           :height 110
                           :weight 'normal)
       (set-face-font 'default font))
     "Fira Code")
    (set-cursor-color "#ff00cc"))))

(provide 'personal)
