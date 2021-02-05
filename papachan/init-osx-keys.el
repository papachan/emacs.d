;;; init-osx-keys.el --- Summary
;;; Commentary:
;;; Code:

;; fix Super instead of option
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
(setq mouse-yank-at-point t)
(setq select-enable-clipboard t)

(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)] (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)

(windmove-default-keybindings)

(provide 'init-osx-keys)
;;; init-osx-keys.el ends here
