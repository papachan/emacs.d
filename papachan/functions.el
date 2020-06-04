;;; fucntions.el file
;;

(defvar current-date-format "%Y-%m-%d")
(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y")
(defvar current-time-format "%a %H:%M:%S")

(defun buffer/clear ()
  (interactive)
  (with-current-buffer (current-buffer)
      (erase-buffer)))

; adding html snippet
(defun snippet-html ()
  (lambda())
  (interactive)
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

(defun snippet-html5 ()
  (lambda())
  (interactive)
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

(defun snippet-clojurescript-reagent ()
  (lambda())
  (interactive)
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

(defun snippet-clojurescript-shadow-cljs ()
  (lambda())
  (interactive)
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

(defun insert-snippet-latin-unicode ()
  (lambda())
  (interactive)
  (insert "iso-8859-1"))

(defun insert-time ()
  (interactive "*")
  (insert (format-time-string "%X")))

(defun insert-current-date ()
  (interactive)
  (insert (format-time-string current-date-format (current-time))))

(defun insert-current-date-time ()
  (interactive "*")
  (insert (format-time-string current-date-time-format (current-time))))

(defun insert-current-time ()
  (interactive "*")
  (insert (format-time-string current-time-format (current-time))))

(defun insert-title ()
  (lambda())
  (interactive)
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

(defun run-cask-test ()
  (interactive "")
  (save-buffer 0)
  (shell-command "make test"))

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
    (emacs-lisp-mode)))

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
  "revert buffer without asking for confirmation"
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
  (lambda ())
  (interactive)
  (let ((url (read-from-minibuffer "Enter url:")))
    (url-copy-file url (url-file-nondirectory url))))

(defun send-output-log ()
  "copy error output to sprunge"
  (interactive)
  (shell-command "cat ~/Desktop/output_error.log | curl -F 'sprunge=<-' http://sprunge.us"))

(defun git-clone-repo ()
  (lambda())
  (interactive)
    (let ((url (read-from-minibuffer "Enter url:")))
      (shell-command (concat "git clone " url))))

(provide 'functions)
;;; misc.el ends here
