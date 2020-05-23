;;; setup-undo.el file
;;
(require 'undo-tree)

(use-package undo-tree
  :commands global-undo-tree-mode
  :diminish undo-tree-mode
  :bind ("C-z" . undo-tree-visualize)
  :init
  (global-undo-tree-mode)

  ;; Each node in the undo tree should have a timestamp.
  (setq undo-tree-visualizer-timestamps t)

  ;; Show a diff window displaying changes between undo nodes.
  (setq undo-tree-visualizer-diff t))


(provide 'setup-undo)
;;; setup-undo.el ends here
