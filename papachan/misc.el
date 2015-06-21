;(let ((path))
;  (setq path (concat "~/.cabal/bin:"
;                     "/usr/local/bin:"
;                     "~/bin:"
;                     "~/dev/elixir/bin"))
;  (setenv "PATH" path))

;(setq exec-path (append exec-path '("~/bin")))

(global-set-key (kbd "C-c m") 'magit-status)

(global-set-key (kbd "C-x M-z")
                '(lambda ()
                   (interactive)
                   (switch-to-buffer "*scratch*")))

(global-set-key (kbd "S-<f1>")
                (lambda ()
                  (interactive)
                  (dired "~/")))

;(global-set-key (kbd "\C-cu")
;    (lambda ()
;        (interactive)
;        (insert "\n")
;        (insert (make-string 40 ?=))
;        (insert "\n"))) 

; slime lfe shortcut
(global-set-key (kbd "<f12>") 'my-save-and-compile)
(defun my-save-and-compile ()
  (interactive "")
  (save-buffer 0)
  (compile "./run"))

(global-set-key "\C-cd" 'kill-whole-line) 

(global-set-key (kbd "<f9>") 'iflipb-next-buffer)
(global-set-key (kbd "<f8>")  'iflipb-previous-buffer)

;; select whole line
(defun select-whole-line ()
  "Select whole line which has the cursor."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

(global-set-key "\C-cw"
                'select-whole-line)

; create empty __init__.py at the place
(defun create-empty-init-py()
  (interactive)
  (shell-command "touch __init__.py")
)
(global-set-key (kbd "C-c p i") 'create-empty-init-py)

(defun insert-a-blank-line (times)
  "insert a new line above the line containing the cursor."
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (newline times)))

(global-set-key "\C-v-o"
                'insert-a-blank-line)


(global-set-key "\C-x\C-b" 'buffer-menu)
