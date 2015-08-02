(defvar  *git-root* "~/git")

(defun git-ido-find-file ()
  (interactive)
  (ido-find-file-in-dir *git-root*))

(provide 'github)
