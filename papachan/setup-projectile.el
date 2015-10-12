;;; setup-projectile.el

(projectile-global-mode)

(defun file-fuzzy-finder ()
  "Open files with projectile-find-file or projectile-find-file-in-directory"
  (interactive)
  (if (projectile-project-p)
    (projectile-find-file)
    (ido-find-file)))

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "C-p") 'file-fuzzy-finder)

(provide 'setup-projectile)
;;; setup-projectile.el ends here
