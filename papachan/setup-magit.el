;;; setup-magit.el

(require 'magit)

(use-package magit
  :config
  ;; C-x C-k to kill file on line
  (defun magit-kill-file-on-line ()
    "Show file on current magit line and prompt for deletion."
    (interactive)
    (magit-visit-item)
    (delete-current-buffer-file)
    (magit-refresh))
  (progn
    (setq magit-push-always-verify nil)
    ; remove git diff frame when open magit commit frame
    (remove-hook 'server-switch-hook 'magit-commit-diff)))


(provide 'setup-magit)
;;; setup-magit.el ends here
