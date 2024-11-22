;;; setup-python.el --- Summary
;;; Commentary:

;;; Code:
(use-package auto-virtualenv
  :load-path "~/.python/env"
  :config
  (setq auto-virtualenv-verbose t)
  (auto-virtualenv-setup))

(use-package python
  :config
  (setq python-indent-offset 4)
  :mode (("\\.py\\'" . python-mode)
         ("\\.pyi\\'" . python-mode)))

(provide 'setup-python)
;;; setup-python.el ends here
