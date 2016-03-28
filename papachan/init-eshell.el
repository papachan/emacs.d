;;; init-eshell.el

(use-package eshell
  :config
  (progn
    (require 'em-smart)
    (require 'ansi-color)
    (defun eshell-new ()
      (interactive)
      (eshell t))

    (defun eshell/clear ()
      "clear the eshell buffer"
      (interactive)
      (let ((inhibit-read-only t))
        (erase-buffer)))
    (setq shell-command-switch "-ic")
    
    (global-set-key  (kbd "C-x e") 'eshell)
    (global-set-key  (kbd "C-x E") 'eshell-new)
    (global-set-key  (kbd "C-x v") 'eshell/clear)

    (setq eshell-directory-name (expand-file-name "eshell"  dotemacs-cache-dir))
    (setq eshell-aliases-file (expand-file-name "eshell/alias" dotemacs-dir))
    (setq eshell-banner-message (concat " Welcome back " user-login-name ".\n"))

    (add-hook 'eshell-mode-hook (lambda ()
                                  'ansi-color-for-comint-mode-on
                                  (setenv "PATH" (shell-command-to-string "source ~/.zshenv; echo -n $PATH"))
                                  (setq-local show-trailing-whitespace nil))))
  
  (message "EShell system is loaded and configured."))



(provide 'init-eshell)

;;; init-eshell.el ends here
