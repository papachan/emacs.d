;(let ((path))
;  (setq path (concat "~/.cabal/bin:"
;                     "/usr/local/bin:"
;                     "~/bin:"
;                     "~/dev/elixir/bin"))
;  (setenv "PATH" path))

;(setq exec-path (append exec-path '("~/bin")))

(global-set-key (kbd "C-x M-z")
                '(lambda ()
                   (interactive)
                   (switch-to-buffer "*scratch*")))

; dired show HOME directory
(global-set-key (kbd "S-<f1>")
                (lambda ()
                  (interactive)
                  (dired "~/")))

; slime lfe shortcut
(defun my-save-and-compile ()
  (interactive "")
  (save-buffer 0)
  (compile "./run"))

;; select whole line
(defun select-whole-line ()
  "Select whole line which has the cursor."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

; create empty __init__.py at the place
(defun create-empty-init-py()
  (interactive)
  (shell-command "touch __init__.py"))

(defun insert-a-blank-line ()
  "insert a new line above the line containing the cursor."
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (newline)))

(defun shutdown-emacs ()
  (interactive)
  (kill-emacs
   (if (featurep 'x) 0 1)))

(defun put-the-date ()
  (interactive)
  (insert (shell-command-to-string "date")))


(global-set-key (kbd "<f12>") 'my-save-and-compile)
(global-set-key (kbd "C-c C-d") 'put-the-date)
(global-set-key (kbd "C-c w") 'select-whole-line)
(global-set-key (kbd "C-x q") 'shutdown-emacs)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c o") 'insert-a-blank-line)
(global-set-key (kbd "C-c d") 'kill-whole-line)
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-c p i") 'create-empty-init-py)
(global-set-key (kbd "<f9>") 'iflipb-next-buffer)
(global-set-key (kbd "<f8>")  'iflipb-previous-buffer)







