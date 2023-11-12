;;; setup-undotree.el --- Summary
;;; Commentary:

;;; Code:
(use-package undo-tree
  :commands global-undo-tree-mode
  :diminish undo-tree-mode
  :bind ("C-z" . undo-tree-visualize)
  :config
  (setq undo-tree-auto-save-history nil)
  :init
  (global-undo-tree-mode))


(provide 'setup-undotree)
;;; setup-undotree.el ends here
