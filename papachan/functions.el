;;; functions.el --- Summary
;;; Commentary:
;;; Code:
(defvar current-date-format "%Y-%m-%d")
(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y")
(defvar current-time-format "%a %H:%M:%S")

(defun change-legacy-deps-to-deps (str &optional from to)
  "Method receives an argument STR as an old vector format.
\ FROM is the beginning of the selected region.
\ TO is the end of the selected region.
\ This method transform Vectors deps to the new deps format."
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (bounds-of-thing-at-point 'paragraph)))
       (list nil (car bds) (cdr bds)))))
  (let (workOnStringP inputStr outputStr)
    (setq workOnStringP (if str t nil))
    (setq inputStr (if workOnStringP str (buffer-substring-no-properties from to)))
    (setq outputStr
          (let ((case-fold-search t))
            (and (string-match "\\[\\(.*\\)\\\s\\(.*\\)\\]" inputStr)
                 (concat (match-string 1 inputStr) " {:mvn/version " (match-string 2 inputStr) "}"))))
    (if workOnStringP
        outputStr
      (save-excursion
        (delete-region from to)
        (goto-char from)
        (insert outputStr)))))

(defun buffer/clear ()
  "Buffer clear."
  (interactive)
  (with-current-buffer (current-buffer)
    (erase-buffer)))

(defun insert-bootstrap-snippet ()
  "Insert an html content."
  (interactive)
  (lambda())
  (insert "<!DOCTYPE html>"
          "<html lang=\"en\">"
          "<head>"
          "<meta charset=\"utf-8\">"
          "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">"
          "<title></title>"
          "<!-- Bootstrap CSS -->"
          "<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">"
          "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>"
          "</head>"
          "<body>"
          "</body>"
          "</html>"))

(defun insert-html-snippet ()
  "Insert an html snippet."
  (interactive)
  (lambda())
  (insert "<!DOCTYPE html>\n"
          "<html lang=\"en\">\n"
          "  <head>\n"
          "    <meta charset=\"UTF-8\"/>\n"
          "    <title></title>\n"
          "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>\n"
          "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n"
          "    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n"
          "  </head>\n"
          "<body>\n<div id=\"app\"></div\n\n</body>\n</html>"))

(defun insert-html5-snippet ()
  "Insert an html5 template."
  (interactive)
  (lambda())
  (insert "<!DOCTYPE html>\n"
          "<html lang=\"en\">\n"
          "  <head>\n"
          "    <meta charset=\"UTF-8\">\n"
          "    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\" />\n"
          "    <link href=\"https://fonts.googleapis.com/css?family=Open+Sans\" rel=\"stylesheet\">\n"
          "    <link rel=\"stylesheet\" href=\"//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/github.min.css\">\n"
          "  </head>\n"
          "  <body>\n"
          "    <div id=\"app\"></div>\n"
          "    <script src=\"/js/app.js\" type=\"text/javascript\"></script>\n"
          "  </body>\n"
          "</html>"))

(defun insert-cljs-reagent-snippet ()
  "Insert a cljs reagent template."
  (interactive)
  (lambda())
  (insert "<!DOCTYPE html>\n"
          "<html lang=\"en\">\n"
          "  <head>\n"
          "    <meta charset=\"UTF-8\" />\n"
          "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
          "    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\" />\n"
          "    <title></title>\n"
          "    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n"
          "    <link rel=\"icon\" href=\"https://clojurescript.org/images/cljs-logo-icon-32.png\" />\n"
          "  </head>\n"
          "  <body>\n"
          "    <noscript>\n"
          "      Javascript not enabled\n"
          "    </noscript>\n"
          "    <div id=\"app\"></div>\n"
          "    <script src=\"cljs-out/dev-main.js\" type=\"text/javascript\"></script>\n"
          "  </body>\n"
          "</html>"))

(defun insert-cljs-shadowcljs-snippet ()
  "Insert a cljs template."
  (interactive)
  (lambda())
  (insert "<!DOCTYPE html>\n"
          "<html lang=\"en\">\n"
          "  <head>\n"
          "    <meta charset=\"UTF-8\" />\n"
          "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
          "    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\" />\n"
          "    <title></title>\n"
          "    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n"
          "    <link rel=\"icon\" href=\"https://clojurescript.org/images/cljs-logo-icon-32.png\" />\n"
          "  </head>\n"
          "  <body>\n"
          "    <noscript>\n"
          "      Javascript not enabled\n"
          "    </noscript>\n"
          "    <div id=\"app\"></div>\n"
          "    <script src=\"js/compiled/main.js\" type=\"text/javascript\"></script>\n"
          "    <script>namespace.init();</script>"
          "  </body>\n"
          "</html>"))

(defun insert-latin-unicode ()
  "Insert ISO latin unicode encoding."
  (interactive)
  (lambda())
  (insert "iso-8859-1"))

(defun insert-time ()
  "Insert time."
  (interactive "*")
  (insert (format-time-string "%X")))

(defun insert-current-date ()
  "Insert current date.  (dd DD MMM aaa HH:mm:ss zzz)."
  (interactive)
  (insert (shell-command-to-string "date")))

(defun insert-current-iso-date ()
  "Insert current date YYYY-MM-DD."
  (interactive)
  (insert (format-time-string current-date-format (current-time))))

(defun insert-current-date-time ()
  "Insert current date.  (dd DD MMM aaa HH:mm:ss zzz)."
  (interactive "*")
  (insert (format-time-string current-date-time-format (current-time))))

(defun insert-current-time ()
  "Insert current time."
  (interactive "*")
  (insert (format-time-string current-time-format (current-time))))

(defun insert-centered-title ()
  "Insert centered title into a text buffer."
  (interactive)
  (lambda())
  (let ((name
         (format "===%s==="
                 (read-from-minibuffer "Enter your title:"))))
    (setq len  (/ (- 72 (length name)) 2)
          blank (make-string len ?\s))
    (insert (concat blank name blank))))

(defun notify-popup (title message)
  "TITLE: a title.  If MESSAGE: a message to be sent.  Use terminal notify-send"
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
  "Shutdown Emacs."
  (interactive)
  (kill-emacs
   (if (featurep 'x) 0 1)))

(defun quit-emacs ()
  "Confirmation before quiting Emacs."
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
  "Twist split buffer."
  (interactive)
  (setq buffer2 (window-buffer (second (window-list))))
  (if (window-top-child (frame-root-window))
      (progn (delete-other-windows) (split-window-horizontally))
    (progn (delete-other-windows) (split-window-vertically)))
  (set-window-buffer (second (window-list)) buffer2))

(defun split-window-right-and-move-there-dammit ()
  "Split a buffer."
  (interactive)
  (split-window-right)
  (windmove-right))

(defun new-empty-buffer ()
  "New empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

(defun new-org-mode-buffer ()
  "New \"org-mode\" buffer."
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
  "N as an argument."
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N 2))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun my-unindent-region (N)
  "N as an argument."
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N -2))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun reload-init-file ()
  "Reload init file."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun open-scratch-buffer ()
  "Open a scratch buffer."
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
  "revert buffer without asking for confirmation"
  (interactive "")
  (revert-buffer t t t))

(defun my-change-number-at-point (change)
  "CHANGE as an argument.  Private method for my-increment-number-at-point."
  (let ((number (number-at-point))
        (point (point)))
    (when number
      (progn
        (forward-word)
        (search-backward (number-to-string number))
        (replace-match (number-to-string (funcall change number)))
        (goto-char point)))))

(defun my-increment-number-at-point ()
  "Increment number at point like vim's ‘C-a’."
  (interactive)
  (my-change-number-at-point '1+))

(defun my-decrement-number-at-point ()
  "Decrement number at point like vim's ‘C-x‘."
  (interactive)
  (my-change-number-at-point '1-))

(defun increment-number-at-point ()
  "Increment number at point."
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun file-path-on-clipboard ()
  "Put the current file name on the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun join-line* ()
  "Join this line with the next line deleting extra white space."
  (interactive)
  (join-line t))

(defun insert-file-into-buffer (filename)
  "FILENAME path as an argument, insert file content into buffer."
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
  "Method to download a file."
  (interactive)
  (lambda ())
  (let ((url (read-from-minibuffer "Enter url:")))
    (url-copy-file url (url-file-nondirectory url))))

(defun git-clone-repo ()
  "Method to clone a repo."
  (interactive)
  (lambda())
    (let ((url (read-from-minibuffer "Enter url:")))
      (shell-command (concat "git clone " url))))

(defun dos2unix()
  "Set dos buffer to unix buffer."
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix))

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
(provide 'functions)
;;; functions.el ends here
