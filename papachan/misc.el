;;; misc.el file
(require 'expand-region)
(require 'window-numbering) ;; Kill buffers which haven't been modified in a while
(require 'midnight)
(require 'whitespace)
(require 'ido)
(require 'helm-config)
(require 'recentf)
(require 'maxframe)

;; local env
(cond
 ((eq system-type 'darwin)
   (setenv "LANG" "en_US.UTF-8")))

(setq whitespace-line-column 90
      whitespace-style '(tabs trailing tab-mark lines-tail))

(if (fboundp 'desktop-save-mode)
    (desktop-save-mode 1))

(recentf-mode 1)
(setq recentf-max-menu-items 25)


; slime lfe shortcut
;; (defun my-save-and-compile ()
;;   (interactive "")
;;   (save-buffer 0)
;;   (compile "./run"))

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
          "<head>\n"
          "<meta charset=\"UTF-8\"/>\n"
          "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>\n"
          "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n"
          "<title></title>\n</head>\n"
          "<body>\n<div id=\"app\"></div\n\n</body>\n</html>"))

(defun snippet-html5 ()
  (lambda())
  (interactive)
  (insert "<!DOCTYPE html>\n"
          "<html lang=\"en\">\n"
          "  <head>\n"
          "    <meta charset=\"UTF-8\">\n"
          "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
          "    <link href=\"https://fonts.googleapis.com/css?family=Open+Sans\" rel=\"stylesheet\">\n"
          "    <link rel=\"stylesheet\" href=\"//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/github.min.css\">\n"
          "  </head>\n"
          "  <body>\n"
          "    <div id=\"app\"></div>\n"
          "    <script src=\"/js/app.js\" type=\"text/javascript\"></script>\n"
          "  </body>\n"
          "</html>"))

(defun snippet-reagent ()
  (lambda())
  (interactive)
  (insert "<!DOCTYPE html>\n"
          "<html>\n"
          "  <head>\n"
          "    <title></title>\n"
          "    <meta charset=\"UTF-8\" />\n"
          "    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n"
          "  </head>\n"
          "  <body>\n"
          "    <div id=\"app\"></div>\n"
          "    <script src=\"cljs-out/dev-main.js\" type=\"text/javascript\"></script>\n"
          "  </body>\n"
          "</html>"))

(defun snippet-latin ()
  (lambda())
  (interactive)
  (insert "iso-8859-1"))

(defun insert-current-date ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

(defun insert-time ()
  (interactive)
  (insert (format-time-string "%X")))

(defun insert-title ()
  (lambda())
  (interactive)
  (let ((name (format "===%s==="
                      (read-from-minibuffer "Enter your title:"))))
    (setq len  (/ (- 72 (length name)) 2)
          blank (make-string len ?\s))
    (insert (concat blank name blank))))

(defun download-url-file ()
  (lambda ())
  (interactive)
  (let ((url (read-from-minibuffer "Enter url:")))
    (url-copy-file url (url-file-nondirectory url))))

;; use notify-send
(defun notify-popup (title message)
  (interactive)
  (let ((str-action (if (eq system-type 'darwin)
                 (concat "terminal-notifier -title " title " -message " message)
               (if (eq system-type 'gnu/linux)
                   (concat "notify-send " title ":" message)))))
    (shell-command str-action)))
;; (notify-popup "hola" "nuevo mensaje")

(defun my-kill-all-visiting-buffers (dir)
  "Kill all buffers visiting DIR or any subdirectory of DIR"
  (interactive "Directory: ")
  (mapc
   (lambda (buf)
     (let ((bfn (buffer-file-name buf)))
       (when (and (not (null bfn))
                  (file-in-directory-p bfn dir))
         (kill-buffer buf))))
   (buffer-list)))

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

(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)
(window-numbering-mode 1)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Prevent lock files from creating.
(setq create-lockfiles nil)
(setq make-backup-files nil)

;; disable system beep
(cond
 ((eq system-type 'gnu/linux)
  (setq visible-bell 1)))

;; Ignore case when searching
(setq case-fold-search t)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Number of characters until the fill column
(setq fill-column 80)

;; prevent vertical split
(setq split-height-threshold 999)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq vc-follow-symlinks t)

; electric mode
(electric-indent-mode +1)

; move-text
(move-text-default-bindings)

; tramp with ssh
(setq tramp-default-method "ssh")

;; ido-mode is like magic pixie dust!
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(cond
 ((eq system-type 'gnu/linux)
  (progn
    (message "max frame init")
    (add-hook 'window-setup-hook 'maximize-frame t)
    ;; delete other windows when open multiple files
    (add-hook 'emacs-startup-hook 'delete-other-windows))))

;; (setq show-paren-style 'expression) ; highlight entire expression
(setq show-paren-style 'parenthesis) ; highlight brackets
;; (setq show-paren-style 'mixed) ; highlight brackets if visible, else entire expression

(setq compilation-read-command nil) ; compile in a status buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; to ensure files have no trailing whitespace

(provide 'misc)
;;; misc.el ends here
