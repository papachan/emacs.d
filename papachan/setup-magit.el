;;; setup-magit.el

(require 'magit)

;; C-x C-k to kill file on line
(defun magit-kill-file-on-line ()
  "Show file on current magit line and prompt for deletion."
  (interactive)
  (magit-visit-item)
  (delete-current-buffer-file)
  (magit-refresh))

(setq magit-push-always-verify nil)

(provide 'setup-magit)
;;; setup-magit.el ends here
