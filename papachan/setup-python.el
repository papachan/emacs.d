;;; setup-python.el
;; python setup
(require 'yasnippet)
(require 'python-mode)

(defun clean-python-files ()
  (interactive)
  (shell-command "find . -name '*.py[co]' -delete")
  (shell-command "find . -name __py*__ -print0 | xargs -0 rm -rf")
  (revert-buffer t t))

; create empty __init__.py at the place
(defun create-empty-init-py()
  (interactive)
  (shell-command "touch __init__.py"))

(use-package python-mode
  :ensure t
  :config (setq python-indent-offset 4))

(use-package python
  :ensure t
  :defer t
  :config
  (setq python-indent-offset 4)
  (add-to-list 'auto-mode-alist '("\\.pyi\\'" . python-mode))
  :interpreter "python"
  :mode ("\\.py\\'" . python-mode))


(provide 'setup-python)
;;; setup-python.el ends here
