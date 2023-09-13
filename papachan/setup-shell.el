;;; setup-shell.el --- Summary
;;; Commentary:
;;; Code:
(require 'em-smart)
(require 'ansi-color)

(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

(defun eshell-new ()
  (interactive)
  (eshell t))

(defun eshell/clear ()
  "clear the eshell buffer"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(use-package eshell
  :config
  (global-set-key  (kbd "C-x t e") 'eshell)
  (global-set-key  (kbd "C-x t E") 'eshell-new)

  (setq eshell-banner-message (concat " Welcome back " user-login-name ".\n"))

  (add-hook 'eshell-mode-hook (lambda ()
                                (define-key eshell-mode-map (kbd "C-x v") 'eshell/clear)
                                'ansi-color-for-comint-mode-on
                                (setq-local show-trailing-whitespace nil)
                                (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))

  :init
  (setq eshell-mv-overwrite-files nil)
  (message "EShell system is loaded and configured."))

(provide 'setup-shell)
;;; setup-shell.el ends here
