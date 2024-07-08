;;; setup-ibuffer.el --- Summary
;;; Commentary:
;;; Code:
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
         ("term" (name . "\*ansi-term-*\*"))
         ("Bash" (mode . sh-mode))
         ("Eshell" (or (name . "\*shell\*")
                       (mode . eshell-mode)))
         ("C#"
          (or (filename . ".*\.cs$")
              (filename . ".*\.csproj$")
              (mode . csharp-mode)))
         ("Dired"
          (or (mode . dired-sidebar-mode)
              (mode . dired-mode)))
         ("Others"
          (or
           (name . "^\\*scratch*")
           (name . "^\\*Messages\\*$")
           (name . "^\\*Group\\*$")
           (name . "^\\*Python*")
           (name . "^\\*slime-repl sbcl\\*$")
           (name . "^\\*inferior-lisp\\*$")))
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
         ("Cider"
          (or
           (name . "^\\*cider-repl")
           (name . "^\\*nrepl-server")
           (name . "^\\*nrepl-messages")
           (name . "^\\*cider-error")))
         ("SQL" (mode . sql-mode))
         ("Log" (filename . ".*\.log$"))
         ("Python" (mode . python-mode))
         ("Erlang" (mode . erlang-mode))
         ("Elixir" (mode . elixir-mode))
         ("Text" (or (mode . org-mode)
                     (filename . ".*\.md$")))
         ("crap" (name . "^\\*.*\\*$")))
        ("Elisp-mode"
         (".el.gz elisp files"
          (name . "\\.el\\.gz$"))
         ("Elisp files"
          (or
           (mode . emacs-lisp-mode)
           (name . "^\\*scratch\\*$")
           (name . "^\\*Messages\\*$"))))
        ("Clojure-Mode"
         ("Clojure code"
          (or (filename . ".*\.cljs$")
              (mode . clojure-mode)
              (mode . clojurescript-mode)
              (mode . clojurec-mode))))
        ("Dired-mode"
         ("Dired"
          (or (mode . dired-sidebar-mode)
              (mode . dired-mode))))))

(defun ibuffer-next-saved-filter-groups-aux (list)
  (if (null ibuffer-saved-filter-groups)
      (error "No saved filters"))
  (let ((next-filter-group) (list0 list))
    (while (and (null next-filter-group) list0)
      (if (equal ibuffer-filter-groups (cdr (car list0)))
          (setq next-filter-group (car (car list0))))
      (setq list0 (cdr list0)))
    (setq list0 (or list0 list))
    (setq ibuffer-filter-groups (cdr (car list0)))
    (message "Switched to \"%s\" filter group!" (car (car list0))))
  (setq ibuffer-hidden-filter-groups nil)
  (ibuffer-update nil t))

(defun ibuffer-next-saved-filter-groups ()
  (interactive)
  (ibuffer-next-saved-filter-groups-aux ibuffer-saved-filter-groups))

(defun ibuffer-previous-saved-filter-groups ()
  (interactive)
  (ibuffer-next-saved-filter-groups-aux
   (reverse ibuffer-saved-filter-groups)))

(define-key ibuffer-mode-map (kbd "C-M-m") #'ibuffer-next-saved-filter-groups)
(define-key ibuffer-mode-map (kbd "C-M-p") #'ibuffer-previous-saved-filter-groups)

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
(define-key ibuffer-mode-map [tab] 'next-line)
(define-key ibuffer-mode-map [(shift tab)] 'previous-line)

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'setup-ibuffer)
;;; setup-ibuffer.el ends here
