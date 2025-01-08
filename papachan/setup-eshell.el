;;; setup-eshell.el --- Summary
;;; Commentary:

;;; Code:
(require 'eshell)
(require 'em-alias)

(eshell/alias "d" "dired $1")
(eshell/alias "cls" "clear")
(eshell/alias "Dd" "cd ~/Desktop")
(eshell/alias "ff" "find-file $1")
(eshell/alias "FF" "find-file-other-window $1")
(eshell/alias "ppo" "helm-projectile")
(eshell/alias "ppf" "projectile-find-file")
(eshell/alias "sc" "cd ~/dev/source_code")
(eshell/alias "clj-repl" "clojure -Sdeps '{:deps {nrepl/nrepl {:mvn/version \"1.3.1\"} cider/cider-nrepl {:mvn/version \"0.51.1\"} refactor-nrepl/refactor-nrepl {:mvn/version \"3.10.0\"}} :aliases {:cider/nrepl {:main-opts [\"-m\" \"nrepl.cmdline\" \"--middleware\" \"[cider.nrepl/cider-middleware]\"]}}}' -M:cider/nrepl -h 0.0.0.0 -p $1")
(eshell/alias "open" "explorer.exe .")

(defun eshell-new ()
  (interactive)
  (eshell t))

(use-package eshell
  :bind (("C-x t e" . eshell)
         ("C-x t E" . eshell-new)))

(provide 'setup-eshell)
;;; setup-eshell.el ends here
