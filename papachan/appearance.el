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
  (when (eq system-type 'gnu/linux)
    (load-file (expand-file-name "vendor/zerodark-theme/zerodark-theme.el" dotemacs-dir))
    (setq zerodark-use-high-contrast-in-mode-line nil)
    (let ((opacity '(87 87)))
      (set-frame-parameter (selected-frame) 'alpha opacity))
    ;; (let ((x 78))
    ;;   ;; transparent frame
    ;;   (set-frame-parameter (selected-frame) 'alpha (cons x '(50)))
    ;;   (add-to-list 'default-frame-alist '(alpha . (cons x '(50)))))
    ))

(provide 'appearance)

;;; appearance.el ends here
