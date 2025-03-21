;;; setup-dired.el --- Summary
;;; Commentary:

;;; Code:

(use-package dired
  ;; :custom
  ;; (dired-listing-switches "-alFh --group-directories-first")
  :config
  (progn
    (define-key dired-mode-map (kbd "M-s") 'rg)
    (define-key dired-mode-map "q"
                (lambda ()
                  "move to the parent directory"
                  (interactive)
                  (find-alternate-file "..")))))

(provide 'setup-dired)
;;; setup-dired.el ends here
