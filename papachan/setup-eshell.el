;;; setup-eshell.el
(use-package eshell
  :bind (("C-x e" . eshell))
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

    (global-set-key  (kbd "C-x E") 'eshell-new)
    (global-set-key  (kbd "C-l") 'eshell/clear)

    (add-hook 'eshell-mode-hook (lambda ()
                                  'ansi-color-for-comint-mode-on
                                  (setenv "PATH" (shell-command-to-string "source ~/.zshenv; echo -n $PATH"))
                                  (setq-local show-trailing-whitespace nil)
                                  (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history))))
  :init
  (progn (setq eshell-mv-overwrite-files nil)
         (setq eshell-banner-message (concat " Welcome back " user-login-name ".\n"))
         (setq eshell-aliases-file (expand-file-name "eshell/alias" dotemacs-dir))))

(provide 'setup-eshell)
;;; setup-eshell.el ends here
