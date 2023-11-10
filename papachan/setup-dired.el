;;; setup-dired.el --- Summary
;;; Commentary:
;;; Code:
(defun my-dired-create-file (file)
  "Create a file called FILE.  If FILE already exists, signal an error."
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
  :init
  (progn
    (setq ls-lisp-dirs-first t
          dired-use-ls-dired nil
          dired-recursive-copies 'always))
  :hook
  (dired-mode-hook . auto-revert-mode)
  :config
  (progn
    (setq inhibit-compacting-font-caches t)
    (put 'dired-find-alternate-file 'disabled nil)
    (define-key dired-mode-map (kbd "M-c") 'copy-file)
    (define-key dired-mode-map (kbd "M-s") 'rg)
    (define-key dired-mode-map (kbd "C-c n") 'my-dired-create-file)
    (mapc (lambda (elt)
            (define-key dired-mode-map (car elt)
              `(lambda ()
                 (interactive)
                 (dired-sort-other (concat dired-listing-switches ,(cadr elt))))))
          '(([(control f3)]       ""     "by name")
            ([(control f4)]       " -X"  "by extension")
            ([(control f5)]       " -t"  "by date")
            ([(control f6)]       " -S"  "by size")
            ([(control shift f3)] " -r"  "by reverse name")
            ([(control shift f4)] " -rX" "by reverse extension")
            ([(control shift f5)] " -rt" "by reverse date")
            ([(control shift f6)] " -rS" "by reverse size")))))

(provide 'setup-dired)
;;; setup-dired.el ends here
