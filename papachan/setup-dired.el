;;; setup-dired.el --- -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; https://oremacs.com/2015/01/12/dired-file-size/
(defun dired-get-size ()
  "Display file size in Dired."
  (interactive)
  (let ((files (dired-get-marked-files)))
    (with-temp-buffer
      (apply 'call-process "/usr/bin/du" nil t nil "-sch" files)
      (message
       "Size of all marked files: %s"
       (progn
         (re-search-backward "\\(^[ 0-9.,]+[A-Za-z]+\\).*total$")
         (match-string 1))))))

;; http://xahlee.info/emacs/emacs/elisp_dired_rename_space_to_underscore.html
(defun xah-dired-rename-space-to-underscore ()
  "Replace space in filenames.
This function renames the currently selected or marked files in Dired
mode, replacing all spaces in their filenames with underscores (_).
  If the function is called outside of Dired mode, it raises an error."
  (interactive)
  (require 'dired-aux)
  (if (eq major-mode 'dired-mode)
      (let ((markedFiles (dired-get-marked-files )))
        (mapc (lambda (x)
                (when (string-match " " x )
                  (dired-rename-file x (replace-regexp-in-string " " "_" x) nil)))
              markedFiles)
        (revert-buffer))
    (user-error "Not in Dired")))

(defun my-dired-create-file (file)
  "Create a file called FILE in the current Dired directory.

If FILE already exists, signal an error.

Usage:
- Call this function interactively (e.g., M-x my-dired-create-file)
- Enter the desired file name when prompted.

Arguments:
- FILE: The name of the file to create.  The function ensures that the
  full path is expanded and any necessary parent directories are created."
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

(use-package dired
  ;; :custom
  ;; (dired-listing-switches "-alFh --group-directories-first")
  :config
  (progn
    (setq dired-dwim-target t)
    (define-key dired-mode-map (kbd "M-c") 'copy-file)
    (define-key dired-mode-map (kbd "M-s") 'rg)
    (define-key dired-mode-map "z" #'dired-get-size)
    (define-key dired-mode-map "_" #'xah-dired-rename-space-to-underscore)
    (define-key dired-mode-map (kbd "C-X C-m") 'compile) ;; call Makefile
    (define-key dired-mode-map "q"
                (lambda ()
                  "move to the parent directory"
                  (interactive)
                  (find-alternate-file "..")))))

(provide 'setup-dired)
;;; setup-dired.el ends here
