;;; setup-eshell.el --- Summary
;;; Commentary:
;;; Code:
(require 'esh-module)
(require 'eshell)
(require 'em-alias)

(use-package shell-pop
  :ensure t
  :bind (("C-c t" . shell-pop))
  :config
  (setq shell-pop-term-shell "/usr/bin/zsh")
  ;; shell-pop-shell-type '("eshell" "*eshell*" (lambda nil (eshell)))
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type)
  (setq shell-pop-window-size 34)
  (setq shell-pop-full-span t)
  (setq shell-pop-window-position "bottom")
  (setq shell-pop-autocd-to-working-dir t)
  (setq shell-pop-restore-window-configuration t)
  (setq shell-pop-cleanup-buffer-at-process-exit t))

(defun eshell-new ()
  (interactive)
  (eshell t))

(eshell/alias "d" "dired $1")
(eshell/alias "cls" "clear")
(eshell/alias "df" "df -h")
(eshell/alias "ff" "find-file $1")
(eshell/alias "FF" "find-file-other-window $1")
(eshell/alias "fd" "find-dired $PWD \" \"")
(eshell/alias "ppf" "projectile-find-file")
(eshell/alias "ppo" "helm-projectile")
(eshell/alias "lsdir" "ls -l | egrep '^d'")
(eshell/alias "Dd" "cd ~/Desktop")
(eshell/alias "repos" "cd ~/git")
(eshell/alias "sc" "cd ~/dev/source_code")
(eshell/alias "clean_mac" "find ./ -name \".DS_Store\" -depth -exec rm {} \\;")
(eshell/alias "clean_all_py_files" "find . -name __py*__ -print0 | xargs -0 rm -rf")
(eshell/alias "gds" "magit-diff-staged")
(eshell/alias "gd" "magit-diff-unstaged")
(eshell/alias "open" "nautilus $1")
(eshell/alias "ps-grep" "ps ax | grep -i $1")
(eshell/alias "sudo" "eshell/sudo $*")
(eshell/alias "ddu" "du -h --max-depth=1 | *sort -hr")
(eshell/alias "clj-repl" "clojure -Sdeps '{:deps {nrepl/nrepl {:mvn/version \"1.3.0\"} cider/cider-nrepl {:mvn/version \"0.50.3\"} refactor-nrepl/refactor-nrepl {:mvn/version \"3.10.0\"}} :aliases {:cider/nrepl {:main-opts [\"-m\" \"nrepl.cmdline\" \"--middleware\" \"[cider.nrepl/cider-middleware]\"]}}}' -M:cider/nrepl -h 0.0.0.0 -p $1")

(use-package eshell
  :bind (("C-x t e" . eshell)
         ("C-x n e" . eshell-new))
  :config
  (progn
    (defun eshell/magit ()
      "Function to open magit-status for the current directory"
      (interactive)
      (require 'magit)
      (magit-status-setup-buffer default-directory)
      nil)

    (defun eshell/clear ()
      "clear the eshell buffer"
      (interactive)
      (let ((inhibit-read-only t))
        (erase-buffer)))

    (add-hook 'eshell-mode-hook (lambda ()
                                  'ansi-color-for-comint-mode-on
                                  (define-key eshell-mode-map (kbd "<f9>") 'emacs-uptime)
                                  (define-key eshell-mode-map (kbd "C-l") 'eshell/clear)
                                  (define-key eshell-mode-map (kbd "C-d") 'kill-this-buffer)
                                  (setenv "PATH" (shell-command-to-string "source ~/.zshenv; echo -n $PATH"))
                                  (setq-local show-trailing-whitespace nil)
                                  ;; (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)
                                  ))
    (setq eshell-visual-commands '("ranger" "vi" "screen" "top" "less" "more" "ncspot"
                                   "vim" "htop"))
    (setq eshell-visual-subcommands '(("git" "log" "diff" "show")))

    (add-to-list 'eshell-modules-list 'eshell-tramp))
  :init
  (setq eshell-mv-overwrite-files nil)
  (setq eshell-banner-message (concat " Welcome back " user-login-name ".\n"))
  (setq eshell-aliases-file (expand-file-name "eshell/alias" user-emacs-directory)))

(setq explicit-shell-file-name "/usr/bin/zsh")

(provide 'setup-eshell)
;;; setup-eshell.el ends here
