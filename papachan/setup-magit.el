;;; setup-magit.el --- Magit for life! -*- lexical-binding: t -*-
;;
;;; Commentary:
;;
;;; Code:

(use-package git-timemachine :ensure t)

(defun read-abs-fp (filepath)
  (when (file-exists-p filepath)
    (with-temp-buffer
      (insert-file-contents filepath)
      (buffer-string))))

(defun browse-git-repo ()
  (interactive)
  (let* ((project-root-dir (vc-root-dir))
         (project-git-cfg (read-abs-fp (file-name-concat (expand-file-name project-root-dir) ".git" "config"))))
    (when (string-match "url = git@\\([^:]+\\):\\(.+\\)\\.git" project-git-cfg)
      (let* ((hostname (match-string 1 project-git-cfg))
             (repo-path (match-string 2 project-git-cfg)))
        (browse-url (concat "https://" hostname "/" repo-path))))))

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
  :bind (("C-c m" . magit-status))
  :config
  (setq magit-save-repository-buffers nil) ; Disable Magit asking to save files
  (setq magit-uniquify-buffer-names nil) ; Make magit buffers be wrapped w/ *

  (define-advice magit-push-current-to-upstream (:before (args) query-yes-or-no)
    "Prompt for confirmation before permitting a push to upstream."
    (when-let ((branch (magit-get-current-branch)))
      (let* ((upstream (or (magit-get-upstream-branch branch)
                           (magit-get "branch" branch "remote")))
             (prompt (if upstream
                         (format "Push %s branch upstream to %s? " branch upstream)
                       (format "Push %s branch to upstream? " branch))))
        (unless (yes-or-no-p prompt)
          (user-error "Push to upstream aborted by user")))))

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
                    '(display-buffer-same-window)))))

  ;; Integrate with ssh-ident
  (add-to-list 'magit-process-password-prompt-regexps
               "^\\(Enter \\)?[Pp]assphrase for [^ ]*: ?$")
  (add-to-list 'magit-process-password-prompt-regexps
               "^Bad passphrase, try again for [^ ]*: ?$"))

(provide 'setup-magit)
;;; setup-magit.el ends here
