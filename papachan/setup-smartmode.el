;;; setup-smartmode.el

;; smart-mode-line
(require 'smart-mode-line)
(require 'powerline)

;; Setup Smart Model Line
(defun smart-mode-line-init()
  (cond
   ((eq system-type 'darwin)
    ;; light theme for mac os
    (setq sml/theme 'light)
    (setq sml/theme 'light-powerline))
   ((eq system-type 'gnu/linux)
    ;; dark theme for linux
    (setq sml/theme 'dark)
    (setq sml/theme 'powerline)))

  (setq-default
   mode-line-format
   '("%e"
     mode-line-front-space
     mode-line-mule-info
     mode-line-client
     mode-line-modified
     mode-line-remote
     mode-line-frame-identification
     mode-line-buffer-identification
     "  "
     mode-line-position
     (vc-mode vc-mode)
     "  "
     mode-line-modes
     mode-line-misc-info
     mode-line-end-spaces))
  (sml/setup)
  ;; don't ask for confirmation
  (setq sml/no-confirm-load-theme t))

(add-hook 'after-init-hook #'smart-mode-line-init)

(provide 'setup-smartmode)
;;; setup-smartmode.el ends here
