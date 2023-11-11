;;; init-undo-tree.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil)
  (undo-tree-visualizer-diff t)
  (undo-tree-history-directory-alist `(("." . ,(expand-file-name ".backup" user-emacs-directory))))
  (undo-tree-visualizer-timestamps t))

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
