;;; init-eshell.el
(require 'em-smart)
(require 'ansi-color)

(use-package eshell
  :config
  (progn
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

    (setq eshell-directory-name (expand-file-name "eshell"  dotemacs-cache-dir))
    (setq eshell-aliases-file (expand-file-name "eshell/alias" dotemacs-dir))
    (setq eshell-banner-message (concat " Welcome back " user-login-name ".\n"))

    (add-hook 'eshell-mode-hook (lambda ()
                                  (define-key eshell-mode-map (kbd "C-x v") 'eshell/clear)
                                  'ansi-color-for-comint-mode-on
                                  (setenv "PATH" (shell-command-to-string "source ~/.zshenv; echo -n $PATH"))
                                  (setq-local show-trailing-whitespace nil)
                                  (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history))))

  :init
  (progn
   (setq eshell-mv-overwrite-files nil))
  (message "EShell system is loaded and configured."))



(provide 'init-eshell)

;;; init-eshell.el ends here
