;;; setup-bootstrap.el
(require 'bootstrap)
(bootstrap)

(defvar files_lst '(
    "iflipb"
    "directory-files-recursive"
    "twittering-mode"
    "helm-aws"
    "lorem-ipsum"))

(defun run-bootstrap (lst)
  "load files from dotfiles-lisp-dir"
  (interactive "P")
  (dolist (file lst)
    (load file)))


(run-bootstrap files_lst)

(provide 'setup-bootstrap)
;;; setup-bootstrap.el ends here