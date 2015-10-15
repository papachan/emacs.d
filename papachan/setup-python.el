;; python setup

;; python mode
(setq py-install-directory "~/.emacs.d/vendor/python-mode.el-6.2.0")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

(load-file "~/.emacs.d/vendor/emacs-for-python/epy-init.el")
(require 'epy-setup)
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

(provide 'setup-python)
;;; setup-python.el ends here
