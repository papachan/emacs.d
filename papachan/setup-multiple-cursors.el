;;; setup-multiple-cursors.el -- Summary
;; Commentary:
;; Code:
(use-package multiple-cursors
 :ensure t
 :commands
 (mc/mark-next-like-this
  mc/mark-all-like-this)

 :config
  (progn
    (setq mc/max-cursors 60))

 :bind
 (("C->" . mc/mark-next-like-this)
  ("C-<" . mc/skip-to-next-like-this)
  ("C-*" . mc/mark-all-like-this)
  ("C-c C->" . mc/mark-all-dwim)
  ("M-RET" . set-rectangular-region-anchor)))

(autoload 'mc/mark-next-like-this "multiple-cursors" nil t)

(provide 'setup-multiple-cursors)
;;; setup-multiple-cursors.el ends here
