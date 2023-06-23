;;; setup-magit.el --- Who doesn't love Magit?
;;
;;; Commentary:
;;
;;; Code:
(require 'pinentry)
(use-package git-timemachine :ensure t)
(use-package magit
  :init
  (pinentry-start)

  :config
  (setq magit-save-repository-buffers nil) ; Disable Magit asking to save files
  (setq magit-uniquify-buffer-names nil)   ; Make magit buffers be wrapped w/ *

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
               "^Bad passphrase, try again for [^ ]*: ?$")

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
  (ad-activate 'magit-git-push))

(provide 'setup-magit)
;;; setup-magit.el ends here
