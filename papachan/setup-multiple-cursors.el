;;; setup-multiple-cursors.el

(use-package multiple-cursors
  :config
  (progn
    (setq mc/max-cursors 30)))

(autoload 'mc/mark-next-like-this "multiple-cursors" nil t)

(provide 'setup-multiple-cursors)
;;; setup-multiple-cursors.el ends here
