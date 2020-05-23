;;; setup-python.el
;; python setup
(require 'yasnippet)
(require 'python-mode)

(defun clean-python-files ()
  (interactive)
  (shell-command "find . -name '*.py[co]' -delete")
  (shell-command "find . -name __py*__ -print0 | xargs -0 rm -rf")
  (revert-buffer t t))

;; create an empty __init__.py
(defun create-empty-init-py()
  (interactive)
  (shell-command "touch __init__.py"))

(use-package python-mode
  :ensure t
  :config
  (progn (setq python-indent-offset 4)
         (setq indent-tabs-mode nil)
         (setq python-indent 4)
         (setq py-switch-buffers-on-execute-p t)
         (setq py-split-window-on-execute nil)
         (setq py-shell-name "~/tmp/runenv.sh")))

(use-package python
  :defer t
  :config
  (setq python-indent-offset 4)
  :interpreter "python"
  :mode (("\\.py\\'" . python-mode)
         ("\\.pyi\\'" . python-mode)))

(provide 'setup-python)
;;; setup-python.el ends here
