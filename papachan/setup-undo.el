;;; setup-undo.el file
;;
(require 'undo-tree)

(use-package undo-tree
  :commands global-undo-tree-mode
  :diminish undo-tree-mode
  :bind ("C-z" . undo-tree-visualize)
  :init
  (global-undo-tree-mode))

(provide 'setup-undo)
;;; setup-undo.el ends here
