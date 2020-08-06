;;; setup-projectile.el --- projectile
;;; Commentary:

;;; Code:
(require 'projectile)

(defun file-fuzzy-finder ()
  "Open files with projectile-find-file or projectile-find-file-in-directory."
  (interactive)
  (if (projectile-project-p)
    (projectile-find-file)
    (ido-find-file)))

(use-package projectile
  :defer t
  :bind (("C-c p p" . projectile-switch-project)
         ("C-c p f" . file-fuzzy-finder))
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching nil
        projectile-track-known-projects-automatically nil)
  ;; (setq projectile-completion-system 'helm)
  ;; (helm-projectile-on)
  ;; (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-mode-line '(:eval (format " Prj[%s]" (projectile-project-name)))))

(provide 'setup-projectile)
;;; setup-projectile.el ends here
