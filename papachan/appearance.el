;;; Appearance --- load emacs theme here

(require 'color)
(require 'all-the-icons)

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
  (if (eq system-type 'gnu/linux)
      (load-file (expand-file-name "vendor/zerodark-theme/zerodark-theme.el" dotemacs-dir))
    (setq zerodark-use-high-contrast-in-mode-line nil)))

(provide 'appearance)

;;; appearance.el ends here
