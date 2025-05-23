;;; setup-shell.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'em-smart)
(require 'ansi-color)

(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

;; (setq explicit-shell-file-name "/bin/zsh")

(provide 'setup-shell)
;;; setup-shell.el ends here
