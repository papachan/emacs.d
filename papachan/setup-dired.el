;;; setup-dired --- define a new method after loading dired
(defun dired-find-directory ()
  "A `dired-find-file' which only works on directories."
  (interactive)
  (let ((find-file-run-dired t)
        (file (dired-get-file-for-visit)))
    (when (file-directory-p file)
      (find-file file))))

(eval-after-load 'dired
  '(progn
     (cond
      ((string-equal system-type "darwin")
       (setq dired-listing-switches "-lFh"))
      (t (setq dired-listing-switches "--si -al")))
     ;; (t (setq dired-listing-switches "-lX --si --group-directories-first"))
     (define-key dired-mode-map (kbd "C-c n") 'my-dired-create-file)
     (define-key dired-mode-map (kbd "<left>") 'dired-jump)
     (define-key dired-mode-map (kbd "<right>") 'dired-find-file)
     (defun my-dired-create-file (file)
       "Create a file called FILE. If FILE already exists, signal an error."
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
           (dired-move-to-filename))))))

(provide 'setup-dired)
;;; setup-dired.el ends here