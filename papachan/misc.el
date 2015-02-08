(let ((path))
  (setq path (concat "~/.cabal/bin:"
                     "/usr/local/bin:"
                     "~/bin:"
                     "~/dev/elixir/bin"))
  (setenv "PATH" path))
