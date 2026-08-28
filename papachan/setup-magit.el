;;; setup-magit.el --- Summary. -*- lexical-binding: nil; -*-
;;; Commentary:

;;; Code:

(use-package git-timemachine)

(defun read-abs-fp (filepath)
  (when (file-exists-p filepath)
    (with-temp-buffer
      (insert-file-contents filepath)
      (buffer-string))))

(defun browse-git-repo ()
  (interactive)
  (let* ((project-root-dir (vc-root-dir)))
    (when project-root-dir
      (let* ((project-git-cfg (read-abs-fp (file-name-concat (expand-file-name project-root-dir) ".git" "config"))))
        (when (string-match "url = git@\\([^:]+\\):\\(.+\\)\\.git" project-git-cfg)
          (let* ((hostname (match-string 1 project-git-cfg))
                 (repo-path (match-string 2 project-git-cfg)))
            (browse-url (concat "https://" hostname "/" repo-path))))))))

(defun browse-commit-at-point ()
  "Open the GitLab commit page for the hash at point.
Uses the current project directory name to construct a URL like:
https://hostname/[git-repository-path]/-/commit/[commit-hash]"
  (interactive)
  (let* ((project-root (or (locate-dominating-file default-directory ".git")
                           default-directory))
         (project-git-cfg (read-abs-fp (file-name-concat (expand-file-name project-root) ".git" "config"))))
    (when (string-match "url = git@\\([^:]+\\):\\(.+\\)\\.git" project-git-cfg)
        (let* ((hostname (match-string 1 project-git-cfg))
               (repo-path (match-string 2 project-git-cfg))
               (commit-hash (or (thing-at-point 'word t)
                                (read-string "Enter commit hash: "))))
          (if (and commit-hash
                   (not (string-empty-p commit-hash)))
              (let* ((url (concat "https://" hostname "/" repo-path
                                  (cond
                                   ((string= hostname "github.com") "/commit/")
                                   ((string= hostname "gitlab.com") "/-/commit/"))
                                  commit-hash)))
                (progn
                  (browse-url url)
                  (message "Opening commit web page: %s" url)))
            (message "No commit hash provided."))))))

(use-package magit
  :ensure t
  :bind (("C-c m" . magit-status))
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

  (define-advice magit-push-current-to-upstream (:before (args) query-yes-or-no)
    "Prompt for confirmation before permitting a push to upstream."
    (when-let* ((branch (magit-get-current-branch)))
      (unless (yes-or-no-p (format "Push %s branch upstream to %s? "
                                   branch
                                   (or (magit-get-upstream-branch branch)
                                       (magit-get "branch" branch "remote"))))
        (user-error "Push to upstream aborted by user"))))

  (progn
    (magit-add-section-hook 'magit-status-sections-hook
                            'magit-insert-unpulled-from-upstream-or-recent
                            'magit-insert-unpushed-to-upstream-or-recent
                            'magit-insert-unpulled-from-upstream
                            'replace)
    (setq magit-diff-highlight-indentation '(("" . tabs)))
    ;; (setq magit-repository-directories
    ;;       '( "~/git" ))
    (setq magit-log-section-commit-count 30)
    (define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)
    (define-key magit-status-mode-map (kbd "C-c e") 'magit-log-buffer-file)
    (setq magit-push-always-verify nil)
    ; remove git diff frame when open magit commit frame
    (remove-hook 'server-switch-hook 'magit-commit-diff)

    (setq magit-display-buffer-function
          (lambda (buffer)
            (display-buffer
             buffer (if (and (derived-mode-p 'magit-mode)
                             (memq (with-current-buffer buffer major-mode)
                                   '(magit-process-mode
                                     magit-revision-mode
                                     magit-diff-mode
                                     magit-stash-mode
                                     magit-status-mode)))
                        nil
                      '(display-buffer-same-window)))))))

(provide 'setup-magit)
;;; setup-magit.el ends here
