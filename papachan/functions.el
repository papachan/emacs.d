;;; functions.el --- Personal utility functions -*- lexical-binding: nil; -*-
;;; Commentary:
;; A collection of utility functions for daily Emacs usage.

;;; Code:

(require 's)
(require 'hi-lock)

(defvar current-date-format "%Y-%m-%d")
(defvar current-date-time-format "%a %b %d %H:%M:%S %z %Y"
  "Format string for current date and time.")
(defvar current-time-format "%a %H:%M:%S")

(defvar change-legacy-deps-regexp
  "\\[\\(.*?\\)[[:space:]]+\\(.*?\\)[[:space:]]*\\]"
  "Regexp matching a legacy Leiningen dependency vector.
Group 1 is the artifact coordinate, group 2 the version.")

(defun change-legacy-deps-to-deps (str &optional from to)
  "Transform legacy vector dependencies to the new map format.
If called interactively and a region is selected, it transforms the content of
the region.
Otherwise, it operates on the paragraph at point.
When called programmatically, STR is the input string to transform.

Every dependency vector found is rewritten in place; the surrounding text
\\(indentation, leading and trailing newlines, comments) is preserved.

FROM and TO specify the region boundaries for interactive use."
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (or (bounds-of-thing-at-point 'paragraph)
                    (user-error "No paragraph at point"))))
       (list nil (car bds) (cdr bds)))))
  (let* ((input-str (or str (buffer-substring-no-properties from to)))
         (output-str (replace-regexp-in-string change-legacy-deps-regexp
                                               "\\1 {:mvn/version \\2}"
                                               input-str t)))
    (cond
     (str output-str)
     ((string= output-str input-str)
      (message "No legacy dependency vector found"))
     (t
      (save-excursion
        (delete-region from to)
        (goto-char from)
        (insert output-str))))))

(defun buffer/clear ()
  "Clear the contents of the current buffer.
This function erases all text in the current buffer, making it empty."
  (interactive)
  (erase-buffer))

(defun insert-latin-unicode ()
  (interactive)
  (lambda())
  (insert "iso-8859-1"))

(defun insert-time ()
  "Insert time stamp as 08:59:39."
  (interactive "*")
  (insert (format-time-string "%T")))

(defun insert-current-iso-date ()
  "Insert current date with YYYY-MM-DD format."
  (interactive)
  (insert (format-time-string current-date-format)))

(defun insert-time-stamp-short ()
  "Insert short date/time stamp as 2024-11-29 10:41."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %R")))

(defun insert-current-date-time ()
  (interactive)
  (insert (format-time-string current-date-time-format)))

(defun insert-current-time ()
  (interactive)
  (insert (format-time-string current-time-format)))

(defun insert-current-date ()
  (interactive)
  (insert (shell-command-to-string "date")))

(defun insert-centered-title ()
  "Insert a centered title into the current text buffer.

This function prompts the user to enter a title, formats it with
\\='===\\=' at the beginning and end, and then inserts it centered within
a 72-character wide line in the current buffer.

Usage:
- Call this function interactively (e.g., \\M-\\x insert-centered-title)
- Enter the desired title when prompted in the minibuffer.

Example:
If the user enters \\='Chapter 1\\=', the following text will be inserted:

                              ===Chapter 1===
"
  (interactive)
  (let* ((title (read-from-minibuffer "Enter your title: "))
         (formatted-title (format "===%s===" title))
         (padding (make-string (max 0 (/ (- 72 (length formatted-title)) 2)) ?\s)))
    (insert (concat padding formatted-title padding))))

(defun notify-popup (title message)
  "use terminal notify-send"
  (interactive)
  (let ((str-action (if (eq system-type 'darwin)
                 (concat "terminal-notifier -title " title " -message " message)
               (if (eq system-type 'gnu/linux)
                   (concat "notify-send " title ":" message)))))
    (shell-command str-action)))

;; select whole line
(defun select-whole-line ()
  "Select whole line which has the cursor."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

(defun insert-a-blank-line ()
  "Insert a new line above the line containing the cursor."
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (newline)))

(defun shutdown-emacs ()
  "Shutdown Emacs."
  (interactive)
  (kill-emacs
   (if (display-graphic-p) 0 1)))

(defun quit-emacs ()
  "Confirmation before quiting Emacs."
  (interactive)
  (when (y-or-n-p "Quit Emacs? ")
    (save-buffers-kill-emacs)))

(defun create-scratch-buffer ()
  "Create a new scratch buffer to work in (*scratch*, *scratch1*, ...)."
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (format "*scratch%s*" (if (= n 0) "" n)))
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
  "Split the current window vertically and move to the newly created window.

This function splits the current window into two side-by-side windows
by creating a new window to the right of the current one.  After splitting,
the focus is moved to the newly created right window."
  (interactive)
  (split-window-right)
  (windmove-right))

(defun new-empty-buffer ()
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))

(defun new-org-mode-buffer ()
  "Create a new buffer in Org mode.

This function creates a new buffer with a unique name, switches to it,
and sets its major mode to Org mode.  The buffer is initialized with a
header line indicating Org mode and a first headline."
  (interactive)
  (let ((buffer (generate-new-buffer-name "*scratch-org*")))
    (pop-to-buffer buffer)
    (with-current-buffer buffer
      (insert "-*- mode: org -*-\n\n")
      (insert "* First Headline\n")
      (insert "** TODO #1 task to be done")
      (org-mode))))

(defun insert-shebang-for-lisp ()
  "Insert into buffer a shebang for Lisp file."
  (interactive)
  (insert ";;; -*- Mode: Lisp; Syntax: Common-Lisp -*-"))

(defun toggle-current-window-dedication ()
  "Toggle current window."
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
  "Reload init file."
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

(defun open-scratch-buffer ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun kill-buffer-file-name-or-default-directory ()
  "Display and add to the kill ring the current buffer's filename or directory."
  (interactive)
  (let* ((file (buffer-file-name))
         (result (or file default-directory)))
    (kill-new result)
    (prog1 result
      (if file
          (message "%s" result)
        (message "Buffer %s not associated with a file; killed default-directory %s"
                 (buffer-name) result)))))

(defun revert-buffer-without-confirmation ()
  "Revert buffer without asking for confirmation."
  (interactive)
  (revert-buffer t t t))

(defun my-change-number-at-point (change)
  "CHANGE as an argument.  Private method for `my-increment-number-at-point'."
  (let ((number (number-at-point))
        (point (point)))
    (when number
      (forward-word)
      (search-backward (number-to-string number))
      (replace-match (number-to-string (funcall change number)))
      (goto-char point))))

(defun my-increment-number-at-point ()
  "Increment number at point like vim's C-a"
  (interactive)
  (my-change-number-at-point #'1+))

(defun my-decrement-number-at-point ()
  "Decrement number at point like vim's C-x"
  (interactive)
  (my-change-number-at-point #'1-))

(defun increment-number-at-point ()
  "Increment number at point."
  (interactive)
  (skip-chars-backward "0-9")
  (unless (looking-at "[0-9]+")
    (user-error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

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

(defconst random-alphanumeric-chars "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  "Alphabet used by `random-alphanumeric-string': base-36, uppercase.")

(defun random-alphanumeric-string (n)
  "Return a random string of N characters drawn uniformly from [0-9A-Za-z]."
  (let ((s (make-string n ?0))
        (len (length random-alphanumeric-chars)))
    (dotimes (i n)
      (aset s i (aref random-alphanumeric-chars (random len))))
    s))

(defun insert-random-alphanumeric-string (&optional n)
  "Insert a random string of N characters from [0-9A-Za-z], then a newline.
N defaults to 12; a numeric prefix argument sets it."
  (interactive "*P")
  (insert (random-alphanumeric-string (if n (prefix-numeric-value n) 12))))

(defun join-line* ()
  "Join this line with the next line deleting extra white space."
  (interactive)
  (join-line t))

(defun insert-file-into-buffer (filename)
  "Replace the current buffer contents with the content of FILENAME."
  (interactive "fInsert file: ")
  (erase-buffer)
  (insert-file-contents filename))

(defun download-url-file (url)
  "Download URL into the current directory."
  (interactive "sEnter url: ")
  (url-copy-file url (url-file-nondirectory url)))

(defun git-clone-repo (url)
  "Clone the repository at URL into the current directory."
  (interactive "sEnter url: ")
  (shell-command (format "git clone %s" (shell-quote-argument url))))

(defun dos2unix()
  "Set dos buffer to unix buffer."
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix))

;; new functions
(defun insert-clj-uuid (n)
  "Insert a Clojure UUID tagged literal built from the digit N.

The prefix argument N specifies the padding used to generate the UUID.
If N is not provided, it defaults to 1. Valid values for N are between 0 and 9, inclusive.

This function inserts a UUID where each segment is composed of the digit N repeated.
For example, if N is 5, the inserted UUID will be #uuid
\"55555555-5555-5555-5555-555555555555\".

Arguments:
N -- The padding digit used to generate the UUID.  Must be between 0 and 9.

Usage:
- Call the function interactively with a prefix argument to specify N.
- If called without a prefix argument, the function defaults to using 1 as the padding digit.

Example:
\\M-\\x insert-clj-uuid 3
Inserts: #uuid \"33333333-3333-3333-3333-333333333333\""
  (interactive "p") ;; This allows the function to accept a numeric prefix argument.
                    ;; If no prefix is provided, n will default to 1.
  (unless (and (>= n 0) (<= n 9))
    (user-error "Argument N must be between 0 and 9"))
  (let ((c (string-to-char (number-to-string n))))
    (insert
     (format "#uuid \"%s-%s-%s-%s-%s\""
             (make-string 8 c)
             (make-string 4 c)
             (make-string 4 c)
             (make-string 4 c)
             (make-string 12 c)))))

(defun random-uuid ()
  "Return a random RFC 4122 version 4 UUID as a string.

The 13th hex digit is always 4 (the version) and the 17th is one of
8, 9, a or b (the variant), which is what makes the result a valid v4
UUID rather than 32 arbitrary hex digits.

Emacs seeds its generator per session, so no explicit `(random t)' is
needed.  This is not a cryptographically secure source of randomness."
  (format "%04x%04x-%04x-4%03x-%x%03x-%04x%04x%04x"
          (random 65536) (random 65536)   ; time-low
          (random 65536)                  ; time-mid
          (random 4096)                   ; time-high, prefixed with version 4
          (logior 8 (random 4))           ; variant: 8, 9, a or b
          (random 4096)                   ; clock-seq
          (random 65536) (random 65536) (random 65536)))  ; node

(defun insert-random-uuid ()
  "Insert a random Clojure UUID tagged literal at point.

Unlike `insert-clj-uuid', which repeats a single digit to build an
easily recognisable placeholder, this inserts a genuine random v4 UUID:

  #uuid \"f47ac10b-58cc-4372-a567-0e02b2c3d479\""
  (interactive "*")
  (insert (format "#uuid \"%s\"" (random-uuid))))

(defun copy-symbol-at-point ()
  "Copy the symbol at point to the kill ring.
Uses `thing-at-point' to get the symbol under the cursor and adds
it to the kill ring, allowing it to be yanked elsewhere."
  (interactive)
  (let ((symbol (thing-at-point 'symbol t)))
    (if symbol
        (kill-new symbol)
      (message "No symbol at point"))))

(defun my-string-at-point ()
  "Copy the content between double quotes at point to the kill ring."
  (interactive)
  (let ((ppss (syntax-ppss)))
    (if (nth 3 ppss)
        (let* ((string-start (nth 8 ppss))
               (string-end (save-excursion
                             (goto-char string-start)
                             (forward-sexp)
                             (point)))
               (content (buffer-substring-no-properties
                         (1+ string-start)
                         (1- string-end))))
          (kill-new content))
      (message "Not inside a quoted string"))))

(defun backward-copy-word ()
  "Copy the word before the cursor to the kill ring.
This function copies the word located immediately before the
cursor's current position.  It uses `save-excursion' to ensure
the cursor's position is not changed after the operation."
  (interactive)
  (save-excursion
    (copy-region-as-kill (point) (progn (backward-word) (point)))))

(defun reopen-last-closed-file ()
  "Reopen the last file that was closed."
  (interactive)
  (if (bound-and-true-p recentf-list)
      (find-file (car recentf-list))
    (message "No recently closed files")))

(defun current-directory ()
  "Open Dired on the current directory."
  (interactive)
  (dired "."))

;; https://olddeuteronomy.github.io/post/some-excerpts-from-config-2-functions/
(defun nuke-all-buffers ()
  "Kill all buffers, leaving *scratch* only."
  (interactive)
  (mapc
   (lambda (buffer)
     (kill-buffer buffer))
   (buffer-list))
  (delete-other-windows))

(defun un-camelcase-word-at-point ()
  "Un-camelcase the word at point.
Uppercase chars are replaced with the lowercase version preceded by
an underscore.  The first char, if capitalized (eg, PascalCase) is
just downcased, with no preceding underscore."
  (interactive)
  (save-excursion
    (let ((bounds (bounds-of-thing-at-point 'word)))
      (when bounds
        (goto-char (1+ (car bounds)))  ; Skip first character
        (let ((case-fold-search nil))
          (while (re-search-forward "[A-Z]" (cdr bounds) t)
            (replace-match (concat "_" (downcase (match-string 0))) t t)))))))

(defun to-snake-case (start end)
  "Change the text between START and END to snake case format.

Snake case is a naming convention where words are separated by
underscores (_) and all letters are in lowercase.  For example,
the string \\='CamelCaseString\\=' would be transformed to
\\='camel_case_string\\='.

Usage:
- Select the region of text you want to transform.
- Call this function interactively (e.g., \\M-\\x to-snake-case)."
  (interactive "r")
  (if (use-region-p)
      (let ((camel-case-str (buffer-substring start end)))
        (delete-region start end)
        (insert (s-snake-case camel-case-str)))
    (message "No region selected")))

;; https://github.com/Fuco1/.emacs.d/blob/master/site-lisp/my-advices.el#L7
(defadvice kill-line (before kill-line-autoreindent activate)
  "Kill excess whitespace when joining lines.

If the next line is joined to the current line, kill the extra indent
whitespace in front of the next line."
  (when (and (eolp) (not (bolp)))
    (save-excursion
      (forward-char 1)
      (just-one-space 1))))

(defvar my-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?- "w")
    table))

(defun get-point (symbol &optional arg)
  "Get the point.  args: SYMBOL, ARG."
  (with-syntax-table my-syntax-table
    (funcall symbol arg)
    (point)))

(defun copy-backward-word ()
  "Copy word before point."
  (interactive)
  (save-excursion
    (let ((beg (get-point #'backward-word 1))
          (end (progn (skip-syntax-forward "^ " (line-end-position))
                      (point))))
      (copy-region-as-kill beg end))))

(defun browse-gitlab-commit-at-point ()
  "Open the GitLab commit page for the hash at point.
Uses the current project directory name to construct a URL like:
https://gitlab.com/USERNAME/PROJECT-NAME/-/commit/HASH"
  (interactive)
  (let* ((hash (or (thing-at-point 'word t)
                   (read-string "Enter commit hash: ")))
         (project-root (or (locate-dominating-file default-directory ".git")
                           default-directory))
         (project-name (file-name-nondirectory (directory-file-name project-root)))
         (url (format "https://gitlab.com/USERNAME/%s/-/commit/%s"
                      project-name hash)))
    (if (and hash (not (string-empty-p hash)))
        (progn
          (browse-url url)
          (message "Opening GitLab commit: %s" url))
      (message "No commit hash provided."))))

(defun format-current-buffer-with-jet ()
  "Format the current buffer's file using jet --pretty and replace buffer contents."
  (interactive)
  (if (not buffer-file-name)
      (message "Buffer is not visiting a file")
    (let* ((command (format "cat %s | jet --pretty" (shell-quote-argument buffer-file-name)))
           (output (shell-command-to-string command)))
      (erase-buffer)
      (insert output)
      (message "Buffer formatted with jet"))))

(defun simple-toggle-highlight-symbol-at-point ()
  "Toggle highlighting for the symbol at point."
  (interactive)
  (let* ((sym (thing-at-point 'symbol t))
         (rexp (regexp-quote sym))
         (faces '(hi-yellow hi-pink hi-green hi-blue hi-salmon hi-aquamarine))
         (random-face (nth (random (length faces)) faces)))
    (if hi-lock-interactive-patterns
        (hi-lock-unface-buffer rexp)
      (hi-lock-face-buffer rexp random-face))))

(defun open-project-deps-edn ()
  "Find and open deps.edn from the current project root."
  (interactive)
  (let ((root (locate-dominating-file default-directory "deps.edn")))
    (if root
        (find-file (expand-file-name "deps.edn" root))
      (message "No deps.edn found in project"))))

(defun find-file-at-point-with-path ()
  "Open a file using the path at point as the initial input.
If there's a filename or path at point, use it as the default.
Otherwise, behave like regular `find-file'."
  (interactive)
  (let ((path-at-point (thing-at-point 'filename t)))
    (if path-at-point
        (find-file (read-file-name "Find file: "
                                   (file-name-directory path-at-point)
                                   nil nil
                                   (file-name-nondirectory path-at-point)))
      (call-interactively #'find-file))))

(defun toggle-boolean ()
  "Toggle the boolean value (true/false) under the cursor."
  (interactive)
  (let* ((bounds (bounds-of-thing-at-point 'symbol))
         (word (and bounds (buffer-substring-no-properties
                            (car bounds) (cdr bounds)))))
    (cond
     ((null bounds)
      (message "No symbol at point"))
     ((string= word "true")
      (delete-region (car bounds) (cdr bounds))
      (insert "false"))
     ((string= word "false")
      (delete-region (car bounds) (cdr bounds))
      (insert "true"))
     (t
      (message "Symbol at point is not a boolean: %s" word)))))

(provide 'functions)
;;; functions.el ends here
