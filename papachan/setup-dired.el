;;; setup-dired.el
(use-package dired
  :init
  (progn
    (setq ls-lisp-dirs-first t
          dired-recursive-copies 'always))
  :hook
  (dired-mode-hook . auto-revert-mode)
  :config
  (progn
    (define-key dired-mode-map (kbd "M-s") 'rg)
    (define-key dired-mode-map (kbd "C-c n") 'my-dired-create-file)
    (define-key dired-mode-map (kbd "<left>") 'dired-jump)
    (define-key dired-mode-map (kbd "<right>") 'dired-find-file)))

(provide 'setup-dired)
;;; setup-dired.el ends here
