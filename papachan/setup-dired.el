;;; setup-dired.el --- Summary. -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(declare-function dired-current-directory "dired" (&optional localp))
(declare-function dired-add-file "dired-aux" (filename &optional marker-char))
(declare-function dired-move-to-filename "dired" (&optional raise-error eol))

(defun dired-rename-space-to-underscore ()
  "In Dired, rename current or marked files, replacing spaces with underscores.
Only the file name is rewritten, never the parent directories.
Signals an error if not in `dired-mode'.  Adapted from:
URL `http://xahlee.info/emacs/emacs/elisp_dired_rename_space_to_underscore.html'"
  (interactive)
  (require 'dired-aux)
  (unless (derived-mode-p 'dired-mode)
    (user-error "Not in Dired"))
  (let* ((files (dired-get-marked-files))
         (single (= 1 (length files)))
         (new-names nil))
    (dolist (path files)
      (let ((dir (file-name-directory path))
            (name (file-name-nondirectory path)))
        (when (string-match-p " " name)
          (let ((new (expand-file-name (string-replace " " "_" name) dir)))
            (dired-rename-file path new nil)
            (push new new-names)))))
    (revert-buffer)
    ;; re-mark what we renamed, so a batch stays selected after the revert
    (dolist (f new-names)
      (dired-goto-file f)
      (unless single (dired-mark 1)))
    ;; dired only advances by itself when it renamed a batch
    (when single (dired-next-line 1))))

(defun my-dired-create-file (file)
  "Create a file called FILE in the current Dired directory.

If FILE already exists, signal an error.

Usage:
- Call this function interactively (e.g., \\M-\\x my-dired-create-file)
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
    (when (file-exists-p expanded)
      (error "Cannot create file %s: file exists" expanded))
    (while (and try (not (file-exists-p try)) (not (equal new try)))
      (setq new try
            try (directory-file-name (file-name-directory try))))
    (unless (file-exists-p dir)
      (make-directory dir t))
    (write-region "" nil expanded t)
    (when new
      (dired-add-file new)
      (dired-move-to-filename))))

(defun dired-find-file-literally ()
  "Visit the file at point in Dired with `find-file-literally'.
Unlike plain `find-file-literally', which always prompts for a file
name (its own interactive spec is \"FFind file literally: \"), this
uses the file at point directly, the way `dired-find-file' does."
  (interactive)
  (find-file-literally (dired-get-file-for-visit)))

(defun dired-open-directory-in-explorer ()
  "Open the current Dired directory in Windows Explorer.
Equivalent to running \"explorer.exe .\" from this directory.
`dired-current-directory' returns a forward-slash path with a
trailing slash (e.g. \"c:/foo/bar/\"); explorer.exe can't parse that
and silently falls back to opening Documents, so the trailing slash
is dropped and the slashes are converted to backslashes first."
  (interactive)
  (unless (derived-mode-p 'dired-mode)
    (user-error "Not in Dired"))
  (let ((dir (directory-file-name (expand-file-name (dired-current-directory)))))
    (start-process "explorer" nil "explorer.exe" (string-replace "/" "\\" dir))))

(defun dired-listing-only-filenames (beg end)
  "Strip `ls -l' columns, leaving only filenames.
Works on the region if active, otherwise the whole buffer.
BEG as a starting point
END as an ending point."
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (point-min) (point-max))))
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (re-search-forward
              (concat "^.*? "
                      "\\(?:"
                      ;; ISO style: 2026-10-22 16:00
                      "[0-9]\\{4\\}-[0-9][0-9]-[0-9][0-9]\\(?: +[0-9][0-9]:[0-9][0-9]\\)?"
                      "\\|"
                      ;; ls-lisp (Windows) numeric style: 05-08 20:49
                      "[0-9][0-9]-[0-9][0-9] +[0-9][0-9]:[0-9][0-9]"
                      "\\|"
                      ;; Default ls style: Oct 22 16:00 or Oct 22  2025
                      "[^ 0-9]+\\.? +[0-9]\\{1,2\\} +\\(?:[0-9][0-9]:[0-9][0-9]\\|[0-9]\\{4\\}\\)"
                      "\\) +")
              nil t)
        (replace-match "")))))

(use-package dired
  :ensure nil
  ;; --group-directories-first needs GNU ls; on Windows dired falls back to
  ;; ls-lisp, where (setq ls-lisp-dirs-first t) is the equivalent.
  :config
  (setq dired-dwim-target t)
  ;; `a' (dired-find-alternate-file) is disabled by default -- it's easy to
  ;; hit by accident and replaces the current Dired buffer with the file.
  (put 'dired-find-alternate-file 'disabled nil)
  (when (fboundp 'rg)
    (define-key dired-mode-map (kbd "C-c s") 'rg))
  ;; NOTE: this shadows q = quit-window. `^' already goes up, and Emacs 28+
  ;; has `dired-kill-when-opening-new-dired-buffer' to avoid buffer pile-up.
  (define-key dired-mode-map "q"
              (lambda ()
                "Move to the parent directory."
                (interactive)
                (find-alternate-file "..")))
  (define-key dired-mode-map (kbd "C-c l") 'dired-find-file-literally)
  (define-key dired-mode-map (kbd "C-c e") 'dired-open-directory-in-explorer))

(provide 'setup-dired)
;;; setup-dired.el ends here