;;; setup-ibuffer.el
;;
(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      '(("default"
         ("Org" (mode . org-mode))
         ("Magit" (or (mode . magit-mode)
                      (mode . magit-status-mode)
                      (mode . magit-log-mode)
                      (mode . magit-process-mode)
                      (mode . magit-revision-mode)))
         ("emacs-config" (or (filename . "\\.emacs\\.d")
                             (filename . ".emacs.d/.*.el$")))
         ("Bash" (mode . sh-mode))
         ("Eshell" (or (name . "\*shell\*")
                       (mode . eshell-mode)))
         ("Dired"
          (or (mode . dired-sidebar-mode)
              (mode . dired-mode)))
         ("Elisp files"
          (mode . emacs-lisp-mode))
         ("Clojure-edn"
          (or (filename . ".*\.edn$")
              (name . "^\\*edn\\*$")))
         ("Lisp"
          (or (filename . ".*\.cljs$")
              (mode . clojure-mode)
              (mode . lisp-mode)
              (mode . scheme-mode)
              (mode . clojurec-mode)
              (mode . racket-mode)))
         ("Ruby"
          (or
           (mode . inf-ruby-mode)
           (mode . ruby-mode)
           (mode . enh-ruby-mode)))
         ("Others"
          (or
           (name . "^\\*scratch\\*$")
           (name . "^\\*Messages\\*$")
           (name . "^\\*Compile-log\\*$")
           (name . "^\\*Help\\*$")
           (name . "^\\*Warnings\\*$")
           (name . "^\\*Bookmark List\\*$")
           ))
         ("SQL" (mode . sql-mode))
         ("Log" (filename . ".*\.log$"))
         ("Python" (mode . python-mode))
         ("Erlang" (mode . erlang-mode))
         ("Elixir" (mode . elixir-mode))
         ("Text" (or (mode . org-mode)
                     (filename . ".*\.md$")))
         ("crap" (name . "^\\*.*\\*$")))
        ))

;; Don't show empty groups
(setq ibuffer-show-empty-filter-groups nil)

;; Files that are part of the same project might be in different
;; filter group.
(setq find-file-visit-truename t)

(defun ibuffer-next-buffer-aux (list)
  (if (null list)
      (error "No buffers!"))
  (let* ((current-buffer (ibuffer-current-buffer t))
         (list1 list)
         next-buffer
         (ibuffer-buffer-list
          (mapcar #'car
                  (ibuffer-current-state-list)))
         (list0 (cdr (member current-buffer list))))
    (while (and list0 (not (memql (car list0) ibuffer-buffer-list)))
      (setq list0 (cdr list0)))
    (ibuffer-jump-to-buffer
     (buffer-name
      (car
       (or list0
           (progn
             (while (not (memql (car list1) ibuffer-buffer-list))
               (setq list1 (cdr list1)))
             list1)))))))

;; navigation
(defun ibuffer-next-buffer ()
  "Jump to next buffer in IBuffer according to `(buffer-list)'"
  (interactive)
  (ibuffer-next-buffer-aux (buffer-list)))

(defun ibuffer-previous-buffer ()
  "Jump to previous buffer in IBuffer according to `(buffer-list)'"
  (interactive)
  (ibuffer-next-buffer-aux
   (reverse (buffer-list))))

(define-key ibuffer-mode-map (kbd "C-b") #'ibuffer-next-buffer)
(define-key ibuffer-mode-map (kbd "C-f") #'ibuffer-previous-buffer)

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) (* 1024 1024))
    (format "%7.1fM" (/ (buffer-size) (* 1024 1024.0))))
   ((> (buffer-size) 1024)
    (format "%7.1fk" (/ (buffer-size) 1024.0)))
   (t (format "%8d" (buffer-size)))))

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide)
              " "
              (size-h 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))

(define-key ibuffer-mode-map (kbd "C-g") #'quit-window)
(define-key ibuffer-mode-map (kbd "C-s") #'helm-buffers-list)

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'setup-ibuffer)
;;; setup-ibuffer.el ends here
