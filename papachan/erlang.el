(let* ((dir "/usr/lib/erlang/"))
  (when (file-accessible-directory-p dir)
    (setq erlang-root-dir dir)
    (add-to-list 'load-path
         (concat dir
             "lib/"
             (car (file-name-all-completions "tools-" (concat dir "lib")))
             "emacs"))
    (add-to-list 'exec-path (concat dir "bin"))
    (require 'erlang-start)
    (defvar inferior-erlang-prompt-timeout t)))
