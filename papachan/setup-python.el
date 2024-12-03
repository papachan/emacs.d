;;; setup-python.el --- Summary
;;; Commentary:

;;; Code:
(use-package python
  :config
  (setq python-indent-offset 4)
  :mode (("\\.py\\'" . python-mode)
         ("\\.pyi\\'" . python-mode)))

(provide 'setup-python)
;;; setup-python.el ends here
