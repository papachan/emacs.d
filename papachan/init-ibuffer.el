;;; init-ibuffer.el
(require 'ibuffer)

(defalias 'list-buffers 'ibuffer)

(eval-after-load 'ibuffer
  (progn
    (setq ibuffer-saved-filter-groups
          '(("home"
             ("emacs-config" (or (filename . ".emacs.d")
                                 (filename . "emacs-config")))
             ("Shell" (or (name . "\*shell\*")
                          (mode . eshell-mode)))
             ("SQL" (mode . sql-mode))
             ("code" (or (filename . "source_code")
                         (mode . python-mode)
                         (mode . ruby-mode)
                         (mode . lisp-mode)))
             ("Org"  (mode . org-mode))
             ("Magit" (or (name . "magit")
                          (mode . magit-status-mode))))))

    (define-ibuffer-sorter filename-or-dired
      "Sort the buffers by their pathname."
      (:description "filenames plus dired")
      (string-lessp
       (with-current-buffer (car a)
         (or buffer-file-name
             (if (eq major-mode 'dired-mode)
                 (expand-file-name dired-directory))
             ;; so that all non pathnames are at the end
             "~"))
       (with-current-buffer (car b)
         (or buffer-file-name
             (if (eq major-mode 'dired-mode)
                 (expand-file-name dired-directory))
             ;; so that all non pathnames are at the end
             "~"))))

    (define-key ibuffer-mode-map (kbd "C-c C-g") 'ibuffer-filter-by-name)
    (define-key ibuffer-mode-map (kbd "J") 'ibuffer-jump-to-buffer)
    (define-key ibuffer-mode-map (kbd "K") 'ibuffer-do-kill-lines)
    (define-key ibuffer-mode-map [tab] 'next-line)
    (define-key ibuffer-mode-map [(shift tab)] 'previous-line)
    (define-key ibuffer-mode-map (kbd "C-g") 'quit-window)))


(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "home")
             (define-key ibuffer-mode-map (kbd "s p") 'ibuffer-do-sort-by-filename-or-dired)))

(provide 'init-buffer)
;;; init-ibuffer.el ends here
