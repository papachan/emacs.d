;;; setup-shell.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'em-smart)
(require 'ansi-color)

(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

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

(setq explicit-shell-file-name "/usr/bin/zsh")

(provide 'setup-shell)
;;; setup-shell.el ends here
