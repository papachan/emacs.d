;;; setup-undo-tree.el --- -*- lexical-binding: nil; -*-
;;; Commentary:
;;; Code:

(use-package undo-tree
  :defer t
  :diminish undo-tree-mode
  :config
  ;; open new frame instead of splitting panes
  (add-to-list 'display-buffer-alist
               (list (lambda (buffer-or-name _action)
                       (and (bound-and-true-p undo-tree-visualizer-parent-buffer)
                            (eq (get-buffer buffer-or-name)
                                undo-tree-visualizer-parent-buffer)))
                     '(display-buffer-reuse-window)
                     '(reusable-frames . 0)))
  :custom
  (undo-tree-auto-save-history nil)
  (undo-tree-visualizer-diff t)
  (undo-tree-history-directory-alist `(("." . ,(expand-file-name ".backup" user-emacs-directory))))
  (undo-tree-visualizer-timestamps t)
  :init
  (global-undo-tree-mode))

(provide 'setup-undo-tree)
;;; init-undo-tree.el ends here