;;; setup-font-system.el -- Summary
;;; Commentary:
;;; Code:
(cond
 ((eq system-type 'gnu/linux)
  (progn
    ((lambda (font)
       (set-frame-font font)
       (set-face-attribute 'default nil
                           :font font
                           :height 102
                           :weight 'normal)
       (set-face-font 'default font))
     "JetBrains Mono")))
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

(provide 'setup-font-system)
;;; setup-font-system.el ends here
