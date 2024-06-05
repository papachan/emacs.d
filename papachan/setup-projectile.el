;;; setup-projectile.el --- projectile
;;; Commentary:

;;; Code:
(require 'projectile)
;; (require 'helm-projectile)

(defun file-fuzzy-finder ()
  "Open files with projectile-find-file or projectile-find-file-in-directory."
  (interactive)
  (if (projectile-project-p)
    (projectile-find-file)
    (ido-find-file)))

(use-package projectile
  :ensure t
  :defer t
  :bind (("C-c p p" . projectile-switch-project)
         ("C-c p f" . file-fuzzy-finder))
  :config
  (projectile-global-mode 1)
  (setq projectile-enable-caching nil
        projectile-track-known-projects-automatically nil)
  (add-to-list 'projectile-globally-ignored-files "*.min.js")
  (add-to-list 'projectile-globally-ignored-directories ".clj-kondo/**")
  (add-to-list 'projectile-globally-ignored-directories ".cpcache")
  (add-to-list 'projectile-globally-ignored-directories ".nrepl-port")
  (add-to-list 'projectile-globally-ignored-directories "js/compiled")
  (add-to-list 'projectile-globally-ignored-directories "resources/public/js")
  (add-to-list 'projectile-globally-ignored-directories "public/js")
  (add-to-list 'projectile-globally-ignored-directories "node[_-]modules")
  (add-to-list 'projectile-globally-ignored-directories "target")
  (setq projectile-mode-line '(:eval (format " Prj[%s]" (projectile-project-name)))))

;; (use-package helm-projectile
;;   :ensure t
;;   :config (helm-projectile-on))

(provide 'setup-projectile)
;;; setup-projectile.el ends here
