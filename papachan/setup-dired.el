;;; setup-dired.el --- Summary
;;; Commentary:

;;; Code:

;; https://oremacs.com/2015/01/12/dired-file-size/
(defun dired-get-size ()
  "Display file size in dired."
  (interactive)
  (let ((files (dired-get-marked-files)))
    (with-temp-buffer
      (apply 'call-process "/usr/bin/du" nil t nil "-sch" files)
      (message
       "Size of all marked files: %s"
       (progn
         (re-search-backward "\\(^[ 0-9.,]+[A-Za-z]+\\).*total$")
         (match-string 1))))))

(use-package dired
  :config
  (progn
    (define-key dired-mode-map (kbd "M-c") 'copy-file)
    (define-key dired-mode-map (kbd "M-s") 'rg)
    (define-key dired-mode-map "z" #'dired-get-size)
    (define-key dired-mode-map "q"
                (lambda ()
                  "move to the parent directory"
                  (interactive)
                  (find-alternate-file "..")))))

(provide 'setup-dired)
;;; setup-dired.el ends here
