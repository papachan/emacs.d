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

  (defun magit-kill-file-on-line ()
    "Show file on current magit line and prompt for deletion."
    (interactive)
    (magit-visit-item)
    (delete-current-buffer-file)
    (magit-refresh))

  ;; magit-status popup set it up with only staged and unstaged changes
  (define-derived-mode magit-staging-mode magit-status-mode "Magit staging"
    "Mode for showing staged and unstaged changes."
    :group 'magit-status)

  (defun magit-staging-refresh-buffer ()
    (magit-insert-section (status)
      (magit-insert-unstaged-changes)
      (magit-insert-staged-changes)))

  (defun magit-staging ()
    (interactive)
    (magit-mode-setup #'magit-staging-mode))

  ;; Protect against accident pushes to upstream
  (defadvice magit-push-current-to-upstream
      (around my-protect-accidental-magit-push-current-to-upstream)
    "Protect against accidental push to upstream.
     Causes `magit-git-push' to ask the user for confirmation first."
    (let ((my-magit-ask-before-push t))
      ad-do-it))

  (defadvice magit-git-push (around my-protect-accidental-magit-git-push)
    "Maybe ask the user for confirmation before pushing.
     Advice to `magit-push-current-to-upstream' triggers this query."
    (if (bound-and-true-p my-magit-ask-before-push)
        ;; Arglist is (BRANCH TARGET ARGS)
        (if (yes-or-no-p (format "Push %s branch upstream to %s? "
                                 (ad-get-arg 0) (ad-get-arg 1)))
            ad-do-it
          (error "Push to upstream aborted by user"))
      ad-do-it))

  (ad-activate 'magit-push-current-to-upstream)
  (ad-activate 'magit-git-push)

  (progn
    (setq magit-repository-directories
          '( "~/git" ))
    (define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)
    (define-key magit-status-mode-map (kbd "C-c e") 'magit-log-buffer-file)
    (setq magit-push-always-verify nil)
    ; remove git diff frame when open magit commit frame
    (remove-hook 'server-switch-hook 'magit-commit-diff)))


(provide 'setup-magit)
;;; setup-magit.el ends here
