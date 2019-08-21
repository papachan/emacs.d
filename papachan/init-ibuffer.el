;;; init-ibuffer.el
(require 'ibuffer)

(defalias 'list-buffers 'ibuffer)

(eval-after-load 'ibuffer
  (progn
    (setq ibuffer-saved-filter-groups
          '(("home"
             ("Magit" (or (mode . magit-mode)
                          (mode . magit-status-mode)
                          (mode . magit-log-mode)
                          (mode . magit-process-mode)
                          (mode . magit-revision-mode)))
             ("emacs-config" (or (filename . "\\.emacs\\.d")
                                 (filename . ".emacs.d/.*.el$")))
             ("Eshell" (or (name . "\*shell\*")
                           (mode . eshell-mode)))
             ("Dired" (mode . dired-mode))
             ("Emacs" (or
                       (name . "^\\*scratch\\*$")
                       (name . "^\\*Completions\\*$")
                       (name . "^\\*Compile-log\\*$")
                       (name . "^\\*Messages\\*$")
                       (name . "^\\*Help\\*$")
                       (name . "^\\*Warnings\\*$")
                       (name . "^\\*Bookmark List\\*$")
                       ))
             ("SQL" (mode . sql-mode))
             ("Log" (filename . ".*\.log$"))
             ("Clojure-edn" (filename . ".*\.edn$"))
             ("Python" (mode . python-mode))
             ("Ruby" (or (mode . ruby-mode)
                         (mode . enh-ruby-mode)))
             ("Erlang" (mode . erlang-mode))
             ("Elixir" (mode . elixir-mode))
             ("Lisp"  (or (mode . emacs-lisp-mode)
                          (filename . ".*\.cljs$")
                          (mode . clojure-mode)
                          (mode . lisp-mode)
                          (mode . scheme-mode)
                          (mode . clojurec-mode)))
             ("Text" (or (mode . org-mode)
                         (filename . ".*\.md$")))
             )))

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
