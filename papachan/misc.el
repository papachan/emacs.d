(let ((path))
  (setq path (concat "~/.cabal/bin:"
                     "/usr/local/bin:"
                     "~/bin:"
                     "~/dev/elixir/bin"))
  (setenv "PATH" path))

(global-set-key (kbd "C-x M-z")
                '(lambda ()
                   (interactive)
                   (switch-to-buffer "*scratch*")))
