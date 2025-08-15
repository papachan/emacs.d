;;; functions.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(require 's)

(defvar current-date-format "%Y-%m-%d")
(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y")
(defvar current-time-format "%a %H:%M:%S")

(defun change-legacy-deps-to-deps ($string &optional $from $to)
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (bounds-of-thing-at-point 'paragraph)))
       (list nil (car bds) (cdr bds)))))
  (let (workOnStringP inputStr outputStr)
    (setq workOnStringP (if $string t nil))
    (setq inputStr (if workOnStringP $string (buffer-substring-no-properties $from $to)))
    (setq outputStr
          (let ((case-fold-search t))
            (and (string-match "\\[\\(.*\\)\\\s\\(.*\\)\\]" inputStr)
                 (concat (match-string 1 inputStr) " {:mvn/version " (match-string 2 inputStr) "}"))))
    (if workOnStringP
        outputStr
      (save-excursion
        (delete-region $from $to)
        (goto-char $from)
        (insert outputStr)))))

(defun buffer/clear ()
  (interactive)
  (with-current-buffer (current-buffer)
    (erase-buffer)))

(defun insert-latin-unicode ()
  (interactive)
  (lambda())
  (insert "iso-8859-1"))

(defun insert-time ()
  "Insert time stamp as 08:59:39."
  (interactive "*")
  (insert (format-time-string "%X")))

(defun insert-current-iso-date ()
  "Insert current date with YYYY-MM-DD format."
  (interactive)
  (insert (format-time-string current-date-format (current-time))))

(defun insert-time-stamp-short ()
  "Insert short date/time stamp as 2024-11-29 10:41."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %R")))

(defun insert-current-date-time ()
  (interactive)
  (insert (format-time-string current-date-time-format (current-time))))

(defun insert-current-time ()
  (interactive)
  (insert (format-time-string current-time-format (current-time))))

(defun insert-title ()
  (interactive)
  (lambda())
  (let ((name
         (format "===%s==="
                 (read-from-minibuffer "Enter your title:"))))
    (setq len  (/ (- 72 (length name)) 2)
          blank (make-string len ?\s))
    (insert (concat blank name blank))))

(defun notify-popup (title message)
  "use terminal notify-send"
  (interactive)
  (let ((str-action (if (eq system-type 'darwin)
                 (concat "terminal-notifier -title " title " -message " message)
               (if (eq system-type 'gnu/linux)
                   (concat "notify-send " title ":" message)))))
    (shell-command str-action)))

(defun my-dired-create-file (file)
  "Create a file called FILE.
If FILE already exists, signal an error."
  (interactive
   (list (read-file-name "Create file: " (dired-current-directory))))
  (let* ((expanded (expand-file-name file))
         (try expanded)
         (dir (directory-file-name (file-name-directory expanded)))
         new)
    (if (file-exists-p expanded)
        (error "Cannot create file %s: file exists" expanded))
    ;; Find the topmost nonexistent parent dir (variable `new')
    (while (and try (not (file-exists-p try)) (not (equal new try)))
      (setq new try
            try (directory-file-name (file-name-directory try))))
    (when (not (file-exists-p dir))
      (make-directory dir t))
    (write-region "" nil expanded t)
    (when new
      (dired-add-file new)
      (dired-move-to-filename))))

;; select whole line
(defun select-whole-line ()
  "Select whole line which has the cursor."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

(defun insert-a-blank-line ()
  "insert a new line above the line containing the cursor."
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (newline)))

(defun shutdown-emacs ()
  (interactive)
  (kill-emacs
   (if (featurep 'x) 0 1)))

(defun put-the-date ()
  (interactive)
  (insert (shell-command-to-string "date")))

; confirmation before quiting emacs
(defun quit-emacs ()
  (interactive)
  (if (y-or-n-p "Quit Emacs? ")
      (save-buffers-kill-emacs)))

(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    ;; (emacs-lisp-mode) ;; if you want to create a new buffer with elisp-mode enabled instead of fundamental-mode
    ))

(defun twist-split ()
  (interactive)
  (setq buffer2 (window-buffer (second (window-list))))
  (if (window-top-child (frame-root-window))
      (progn (delete-other-windows) (split-window-horizontally))
    (progn (delete-other-windows) (split-window-vertically)))
  (set-window-buffer (second (window-list)) buffer2))

(defun split-window-right-and-move-there-dammit ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun new-empty-buffer ()
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

(defun new-org-mode-buffer ()
  (interactive)
  (let ((buffer (get-buffer-create (generate-new-buffer-name "*scratch-org*"))))
    (pop-to-buffer buffer)
    (with-current-buffer buffer
      (funcall (and initial-major-mode))
      (insert "-*- mode: org -*-\n\n")
      (insert "* First Headline\n")
      (org-mode))))

(defun insert-shebang-for-lisp ()
  "Insert into buffer a shebang for Lisp file."
  (interactive)
  (insert ";;; -*- Mode: Lisp; Syntax: Common-Lisp -*-"))

(defun toggle-current-window-dedication ()
  (interactive)
  (let* ((window    (selected-window))
         (dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not dedicated))
    (message "Window %sdedicated to %s"
             (if dedicated "no longer " "")
             (buffer-name))))

;; Unindent
(defun my-indent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N 2))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun my-unindent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N -2))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun open-scratch-buffer ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun kill-buffer-file-name-or-default-directory ()
  "Display and add to the kill ring the current buffer's filename or directory."
  (interactive)
  (let ((buffer-file-name (buffer-file-name))
        (result (or buffer-file-name default-directory)))
    (kill-new result)
    (prog1 result
      (if buffer-file-name (message "%s" result)
        (message "Buffer %s not associated with a file; killed default-directory %s" (buffer-name) result)))))

(defun revert-buffer-without-confirmation()
  "Revert buffer without asking for confirmation"
  (interactive "")
  (revert-buffer t t t))

(defun my-change-number-at-point (change)
  (let ((number (number-at-point))
        (point (point)))
    (when number
      (progn
        (forward-word)
        (search-backward (number-to-string number))
        (replace-match (number-to-string (funcall change number)))
        (goto-char point)))))

(defun my-increment-number-at-point ()
  "Increment number at point like vim's C-a"
  (interactive)
  (my-change-number-at-point '1+))

(defun my-decrement-number-at-point ()
  "Decrement number at point like vim's C-x"
  (interactive)
  (my-change-number-at-point '1-))

(defun file-path-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun random-11-letter-string ()
  (interactive)
  (progn
    (dotimes (_ 11)
      (insert
       (upcase
        (let ((x (random 36)))
          (if (< x 10)
              (+ x ?0)
            (+ x (- ?a 10)))))))
    (newline)))

(defun join-line* ()
  "Join this line with the next line deleting extra white space."
  (interactive)
  (join-line t))

(defun insert-into-buffer (filename)
  "Insert file content into buffer, useful when switching the content of a file"
  (interactive)
  (let ((buf (current-buffer)))
    (with-current-buffer buf
      (erase-buffer))
    (save-excursion
      (with-temp-buffer
        (insert-file-contents filename)
        (goto-char 1)
        (append-to-buffer buf (point) (point-max))))))

(defun download-url-file ()
  (interactive)
  (lambda ())
  (let ((url (read-from-minibuffer "Enter url:")))
    (url-copy-file url (url-file-nondirectory url))))

(defun send-output-log ()
  "copy error output to sprunge"
  (interactive)
  (shell-command "cat ~/Desktop/output_error.log | curl -F 'sprunge=<-' http://sprunge.us"))

(defun git-clone-repo ()
  (interactive)
  (lambda())
    (let ((url (read-from-minibuffer "Enter url:")))
      (shell-command (concat "git clone " url))))

;; new functions
(defun insert-clj-uuid (n)
  "Insert a Clojure UUID tagged literal in the form of #uuid
  \"11111111-1111-1111-1111-111111111111\". The prefix argument N
  specifies the padding used."
  (interactive "P")
  (let ((n (or n 1)))
    (if (or (< n 0) (> n 9))
        (error "Argument N must be between 0 and 9."))
    (let ((n (string-to-char (number-to-string n))))
      (insert
       (format "#uuid \"%s-%s-%s-%s-%s\""
               (make-string 8 n)
               (make-string 4 n)
               (make-string 4 n)
               (make-string 4 n)
               (make-string 12 n))))))

(defun backward-copy-word ()
  "Something"
  (interactive)
  (save-excursion
    (copy-region-as-kill (point) (progn (backward-word) (point)))))

(defun reopen-last-closed-file ()
  "Reopen the last file that was closed."
  (interactive)
  (if recentf-list
      (find-file (car recentf-list))
    (message "No recently closed files")))

;; https://olddeuteronomy.github.io/post/some-excerpts-from-config-2-functions/
(defun nuke-all-buffers ()
  "Kill all buffers, leaving *scratch* only."
  (interactive)
  (mapc
   (lambda (buffer)
     (kill-buffer buffer))
   (buffer-list))
  (delete-other-windows))

(defun current-directory ()
  (interactive)
  (dired "."))

(defun un-camelcase-word-at-point ()
  "un-camelcase the word at point, replacing uppercase chars with
the lowercase version preceded by an underscore.

The first char, if capitalized (eg, PascalCase) is just
downcased, no preceding underscore.
"
  (interactive)
  (save-excursion
    (let ((bounds (bounds-of-thing-at-point 'word)))
      (replace-regexp "\\([A-Z]\\)" "_\\1" nil
                      (1+ (car bounds)) (cdr bounds))
      (downcase-region (car bounds) (cdr bounds)))))

(defun to-snake-case (start end)
"Change selected text to snake case format.

Snake case is a naming convention where words are separated by
underscores (_) and all letters are in lowercase. For example,
the string 'CamelCaseString' would be transformed to 'camel_case_string'.

Usage:
- Select the region of text you want to transform.
- Call this function interactively (e.g., M-x to-snake-case).

The interactive argument \"r\" refers to the region's start and end points.

Example:
- If you select the text 'CamelCaseString' and call this function,
  it will be transformed to 'camel_case_string'."
  (interactive "r")
  (if (use-region-p)
      (let ((camel-case-str (buffer-substring start end)))
        (delete-region start end)
        (insert (s-snake-case camel-case-str)))
    (message "No region selected")))

;; https://github.com/Fuco1/.emacs.d/blob/master/site-lisp/my-advices.el#L7
(defadvice kill-line (before kill-line-autoreindent activate)
  "Kill excess whitespace when joining lines.
If the next line is joined to the current line, kill the extra indent whitespace in front of the next line."
  (when (and (eolp) (not (bolp)))
    (save-excursion
      (forward-char 1)
      (just-one-space 1))))

(defun get-point (symbol &optional arg)
  "Get the point.  args: SYMBOL, ARG."
  (funcall symbol arg)
  (point))

(defun copy-backward-word ()
  "Copy word before point."
  (interactive "")
  (save-excursion
    (let ((beg (get-point 'backward-word 1))
          (end (progn (skip-syntax-forward "^ " (line-end-position))
                      (point))))
      (copy-region-as-kill beg end))))

(defvar my-jira-instance-url "https://url.atlassian.net"
  "Your Jira instance base URL.")

(defun my-open-jira-ticket (ticket-code)
  "Open a Jira ticket in your default web browser.
The TICKET-CODE should be in the format \"XXX-123\"."
  (interactive "")
  (let* ((jira-url (format "%s/browse/%s" my-jira-instance-url (upcase ticket-code))))
    (browse-url jira-url)
    (message "Opening Jira ticket: %s" jira-url)))

(provide 'functions)
;;; functions.el ends here
