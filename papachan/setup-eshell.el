;;; setup-eshell.el
(require 'esh-module)

(use-package shell-pop
  :ensure t
  :disabled
  :commands shell-pop
  :init
  (setq shell-pop-term-shell "/usr/local/bin/zsh")
  (setq shell-pop-shell-type '("eshell" "*eshell*" (lambda nil (eshell)))))

(defun eshell-new ()
  (interactive)
  (eshell t))

(use-package eshell
  :bind (("C-x e" . eshell)
         ("C-x E" . eshell-new))
  ;; :bind (:map eshell-mode-map ("<f9>" . emacs-uptime))
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
                                  (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))
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
