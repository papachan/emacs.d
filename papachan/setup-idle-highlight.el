;;; setup-idle-highlight.el --- Summary
;;; Commentary:
;;; Code:

(use-package idle-highlight-mode
  :ensure t
  :config (setq idle-highlight-idle-time 0.2)
  :hook ((prog-mode text-mode) . idle-highlight-mode))

(provide 'setup-idle-highlight)
;;; setup-idle-highlight.el ends here
