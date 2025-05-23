;;; init-undo-tree.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-auto-save-history nil
        split-height-threshold 0)
  :custom
  (setq undo-tree-auto-save-history nil))

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
