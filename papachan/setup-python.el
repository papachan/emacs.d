(require 'yasnippet)
(require 'python-mode)

(use-package python-mode
  :ensure t
  :config (setq python-indent-offset 4))

(use-package python
	:mode ("\\.py" . python-mode))

(defun clean-python-files ()
  (interactive)
  (shell-command "find . -name '*.py[co]' -delete")
  (shell-command "find . -name __py*__ -print0 | xargs -0 rm -rf")
  (revert-buffer t t))

; create empty __init__.py at the place
(defun create-empty-init-py()
  (interactive)
  (shell-command "touch __init__.py"))


(provide 'setup-python)
;;; setup-python.el ends here
