;;; Appearance --- load emacs theme here
;;; Commentary:
;;; Code:
(require 'color)
(require 'all-the-icons)
(require 'smart-mode-line)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (scroll-bar-mode 1)
  (display-time)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (column-number-mode)
  ;; Highlight current line
  (global-hl-line-mode 1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (cond
   ((eq system-type 'gnu/linux)
    (load-file (expand-file-name "themes/zerodark-theme/zerodark-theme.el" user-emacs-directory))
    (load-theme 'zerodark t)
    ;; setup modeline
    ;; (zerodark-setup-modeline-format)
    (setq zerodark-use-high-contrast-in-mode-line nil)
    ;; transparency
    (let ((opacity '(87 87)))
      (set-frame-parameter (selected-frame) 'alpha opacity)))
   ((eq system-type 'darwin)
    (load-theme 'nimbus t))))

(provide 'appearance)
;;; appearance.el ends here
