;;; Appearance --- load emacs theme here

(require 'color-theme)
(require 'color)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (scroll-bar-mode 1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (load-file "~/.emacs.d/vendor/zenburn-emacs/zenburn-theme.el")) 

(provide 'appearance)

;;; appearance.el ends here
