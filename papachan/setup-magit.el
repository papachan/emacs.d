;;; setup-magit.el

(require 'magit)

(use-package magit
  :config
  (defun add-pull-request-refs (&optional remote local-ns)
    "Set pull requests refs from a REMOTE with LOCAL-NS namespace into Git config."
    (interactive (let* ((remote (magit-read-remote "Fetch remote"))
                        (local-ns (read-string "local namespace: " (format "%s/pr" remote))))
                   (list remote local-ns)))
    (and (not (magit-get-boolean "core" "disableprref"))
         (let* ((remote (or remote "origin"))
                (local-ns (if (or (null local-ns) (string= "" local-ns)) (format "%s/pr" remote) local-ns))
                (pr-refs (format "+refs/pull/*/head:refs/remotes/%s/*" local-ns))
                (remote-fetch-refs (magit-get-all "remote" remote "fetch")))
           (and remote-fetch-refs
                (not (magit-get-boolean "remote" remote "disableprref"))
                (not (member pr-refs remote-fetch-refs))
                (string-match "github.com" (magit-get "remote" remote "url"))
                (magit-git-string "config" "--add" (format "remote.%s.fetch" remote) pr-refs)))))
  ;; C-x C-k to kill file on line
  (defun magit-kill-file-on-line ()
    "Show file on current magit line and prompt for deletion."
    (interactive)
    (magit-visit-item)
    (delete-current-buffer-file)
    (magit-refresh))
  (progn
    (define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)
    (setq magit-push-always-verify nil)
    ; remove git diff frame when open magit commit frame
    (remove-hook 'server-switch-hook 'magit-commit-diff)
    ;(add-hook 'magit-mode-hook 'add-pull-request-refs)
    ))


(provide 'setup-magit)
;;; setup-magit.el ends here
