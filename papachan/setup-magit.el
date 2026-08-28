;;; setup-magit.el --- Magit for life! -*- lexical-binding: t -*-
;;
;;; Commentary:
;;
;;; Code:
(require 'pinentry)
(use-package git-timemachine :ensure t)
(use-package magit
  :init
  (pinentry-start)

  :bind (("C-c m" . magit-status))

  :config
  (setq magit-save-repository-buffers nil) ; Disable Magit asking to save files
  (setq magit-uniquify-buffer-names nil)   ; Make magit buffers be wrapped w/ *

  (define-advice magit-push-current-to-upstream (:before (args) query-yes-or-no)
  "Prompt for confirmation before permitting a push to upstream."
  (when-let* ((branch (magit-get-current-branch)))
    (unless (yes-or-no-p (format "Push %s branch upstream to %s? "
                                 branch
                                 (or (magit-get-upstream-branch branch)
                                     (magit-get "branch" branch "remote"))))
      (user-error "Push to upstream aborted by user"))))

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
