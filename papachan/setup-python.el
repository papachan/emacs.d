;; python setup

;; python mode
(setq python-indent-offset 4)
(setq py-install-directory
      (expand-file-name "vendor/python-mode.el"  dotemacs-dir))
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

(defun clean-python-files ()
  (interactive)
  (shell-command "find . -name '*.py[co]' -delete"))

; create empty __init__.py at the place
(defun create-empty-init-py()
  (interactive)
  (shell-command "touch __init__.py"))

(load-file
 (expand-file-name "vendor/emacs-for-python/epy-init.el"  dotemacs-dir))
(require 'epy-setup)
(setq epy-enable-ropemacs nil)
(require 'epy-python)
(require 'epy-completion)
(require 'epy-editing)
(require 'epy-bindings)
(require 'epy-nose)
(require 'yasnippet)

(when (executable-find "pyflakes")
  (epy-setup-checker "pyflakes %f"))
(epy-setup-ipython)
(global-hl-line-mode t)
(global-set-key (kbd "C-c !") 'python-shell-switch-to-shell)
(global-set-key (kbd "C-x C-g") 'clean-python-files)
(global-set-key (kbd "C-c M-a") 'create-empty-init-py)

;; (setq flymake-log-level 3)

(provide 'setup-python)
;;; setup-python.el ends here
