;;; Appearance --- load emacs theme here

(require 'color-theme)
(require 'color)
(require 'all-the-icons)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (scroll-bar-mode 1)
  (display-time)
  ;; Highlight current line
  (global-hl-line-mode 1)
  ;; Highlight matching parentheses when the point is on them.
  (show-paren-mode 1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (cond
   ((eq system-type 'gnu/linux)
    (load-file (expand-file-name "vendor/zerodark-theme/zerodark-theme.el" dotemacs-dir)))))

(provide 'appearance)

;;; appearance.el ends here
