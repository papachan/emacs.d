;;; setup-cider.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Cider setup
;;; Clojure IDE and REPL for Emacs
;;; Code:
(use-package company :ensure t)

;; (defun clerk-show ()
;;   (interactive)
;;   (when-let
;;       ((filename
;;         (buffer-file-name)))
;;     (save-buffer)
;;     (cider-interactive-eval
;;      (concat "(nextjournal.clerk/show! \"" filename "\")"))))

(defun open-portal ()
  (interactive)
  (cider-interactive-eval
   "(require '[portal.api :as p])
     (do
       (def p (p/open))
       (add-tap #'p/submit))"))

(defun clear-portal ()
  (interactive)
  (cider-interactive-eval
   "(require '[portal.api :as p])
    (p/clear)"))

(defun enable-humane-test-output ()
  (interactive)
  (cider-interactive-eval
   "(require '[pjstadig.humane-test-output])
    (pjstadig.humane-test-output/activate!)"))

(defun toggle-logging-off ()
  (interactive)
  (cider-interactive-eval
   "(require '[logging.core])
    (logging.core/init! {} {:min-level :error})"))

(defun my/kill-dead-repls ()
  "Kill all dead REPL buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (when (and (string-match "\\*cider-repl" (buffer-name buffer))
               (with-current-buffer buffer
                 (not (process-live-p (get-buffer-process buffer)))))
      (kill-buffer buffer))))

(defun my/gitlab-project-root ()
  "Find the root of the current project (looks for a `.git' directory)."
  (or (locate-dominating-file default-directory ".git")
      (error "Not inside a git project")))

(defun my/gitlab-remote-path (root)
  "Return \"namespace/project\" for the GitLab remote configured in ROOT."
  (let* ((default-directory root)
         (url (string-trim (shell-command-to-string "git remote get-url origin"))))
    (cond
     ((string-match "\\`git@[^:]+:\\(.*?\\)\\(\\.git\\)?\\'" url)
      (match-string 1 url))
     ((string-match "\\`https?://[^/]+/\\(.*?\\)\\(\\.git\\)?\\'" url)
      (match-string 1 url))
     (t (error "Could not parse GitLab remote URL: %s" url)))))

(defun my/gitlab-current-branch (root)
  "Return the current git branch name in ROOT, or \"main\" if detached/unknown."
  (let* ((default-directory root)
         (branch (string-trim (shell-command-to-string "git rev-parse --abbrev-ref HEAD"))))
    (if (or (string-empty-p branch) (string= branch "HEAD"))
        "main"
      branch)))

(defun open-file-on-gitlab (&optional use-main-branch)
  "Open the current file on GitLab web at the same line as point.
Works for files under either the src or test directory of the project.
With prefix argument USE-MAIN-BRANCH, link against \"main\" instead of
the current branch."
  (interactive "")
  (if (not buffer-file-name)
      (message "Buffer is not visiting a file")
    (let* ((root (my/gitlab-project-root))
           (project-path (my/gitlab-remote-path root))
           (branch (if use-main-branch "main" (my/gitlab-current-branch root)))
           (relative-path (file-relative-name buffer-file-name root))
           (line (line-number-at-pos))
           (url (format "https://gitlab.com/%s/-/blob/%s/%s#L%d"
                        project-path branch relative-path line)))
      (browse-url url)
      (message "Opening %s" url))))

(use-package cider
  :ensure t
  :defer t
  :after clojure-mode
  :commands (cider-mode cider-connect cider-jack-in)
  :bind (("C-c M-j" . cider-jack-in)
         ("C-c a"   . cider-eval-print-last-sexp)
         ("C-M-g"   . open-portal)
         ;; ("C-M-y"   . enable-humane-test-output)
         (:map cider-repl-mode-map
               ("C-X sc" . cider-repl-clear-buffer))
         (:map cider-repl-mode-map
               ("C-c C-x" . cider-ns-refresh))
         (:map cider-repl-mode-map
               ("RET" . cider-repl-newline-and-indent))
         (:map cider-repl-mode-map
               ("C-<return>" . cider-repl-return)))
  :config
  (setq
   ;; result prefix for the REPL
   cider-repl-result-prefix ";; => "
   ;; display cider repl in the current window
   cider-repl-display-in-current-window t
   ;; set helper message to false
   cider-repl-display-help-banner nil
   ;; error buffer not popping up
   cider-show-error-buffer nil
   ;; looong history
   cider-repl-history-size 3000
   ;; never ending REPL history
   cider-repl-wrap-history t
   ;; nice pretty printing
   cider-repl-use-pretty-printing t
   ;; weird issues with highlighting code, highlight all branches of reader conditionals
   cider-font-lock-reader-conditionals nil
   ;; nrepl log messages
   nrepl-log-messages t
   ;; disable auto-complete
   cider-completion-display-context nil
   ;; disable popup asking to connect to a dead repl
   cider-repl-auto-detect-type t
   cider-auto-select-error-buffer nil)

  :hook
  (cider-mode . eldoc-mode)
  (cider-mode . company-mode)
  (cider-repl-mode . paredit-mode)
  (cider-repl-mode . company-mode)
  (cider-repl-mode . eldoc-mode)
  (cider-repl-mode . (lambda ()
                       (cider-repl-toggle-pretty-printing)
                       (tab-line-mode -1)
                       (helm-cider-mode 1)))
  (cider-connected-hook . my/kill-dead-repls))

(use-package kaocha-runner
  :after (cider-mode)
  :bind (:map clojure-mode-map
              ("C-c k t" . kaocha-runner-run-test-at-point)
              ("C-c k r" . kaocha-runner-run-tests)
              ("C-c k a" . kaocha-runner-run-all-tests)
              ("C-c k w" . kaocha-runner-show-warnings)
              ("C-c k h" . kaocha-runner-hide-windows)))

(use-package helm-cider
  :ensure t
  :hook ((cider-mode . helm-cider-mode)))

(provide 'setup-cider)
;;; setup-cider.el ends here
