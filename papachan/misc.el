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

(global-set-key (kbd "S-<f1>")
                (lambda ()
                  (interactive)
                  (dired "~/")))
