;;; setup-undotree.el --- Summary. -*- lexical-binding: nil; -*-
;;; Commentary:

;;; Code:
(use-package undo-tree
  :commands global-undo-tree-mode
  :diminish undo-tree-mode
  :bind ("C-z" . undo-tree-visualize)
  :config
  (setq undo-tree-auto-save-history nil)
  (add-to-list 'display-buffer-alist
               (list (rx bos " *undo-tree*" eos)
                     '(display-buffer-reuse-window display-buffer-pop-up-frame)
                     '(reusable-frames . 0)
                     '(inhibit-same-window . t)))
  ;; The above alone still leaves the undo-tree frame splitting in two on
  ;; every undo/redo: `undo-tree-visualize-undo'/`-redo' additionally
  ;; re-display `undo-tree-visualizer-parent-buffer' (the buffer being
  ;; edited) "in another window" to apply the step, then switch back. That
  ;; parent buffer doesn't match the regexp above, so without this second
  ;; entry it falls through to the default action and splits the undo-tree
  ;; frame -- the window the previous entry is specifically there to avoid.
  ;;
  ;; `undo-tree-visualizer-parent-buffer' is buffer-local to the visualizer
  ;; buffer, and that's `current-buffer' at the point these calls happen, so
  ;; matching against it directly (rather than the buffer-local parent
  ;; buffer's possibly-unpredictable name) correctly picks out just that one
  ;; buffer. Reusing its existing window (almost always still visible in
  ;; the frame the visualizer was opened from) means momentarily raising
  ;; that frame to apply the edit, then back to the undo-tree frame -- a
  ;; brief frame-focus flicker each step, but no window splitting.
  (add-to-list 'display-buffer-alist
               (list (lambda (buffer-or-name _action)
                       (and (bound-and-true-p undo-tree-visualizer-parent-buffer)
                            (eq (get-buffer buffer-or-name)
                                undo-tree-visualizer-parent-buffer)))
                     '(display-buffer-reuse-window)
                     '(reusable-frames . 0)))
  :init
  (global-undo-tree-mode))


(provide 'setup-undotree)
;;; setup-undotree.el ends here