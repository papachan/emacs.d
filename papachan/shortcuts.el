;;; shortcuts.el --- Summary
;;; Commentary:
;;; Code:
(require 'expand-region)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-c =") 'er/expand-region) ;; windows issue with C-=
(global-set-key (kbd "M-n") 'er/mark-word)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c <deletechar>") 'fixup-whitespace)
(global-set-key (kbd "C-c w") 'select-whole-line)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-c C-o") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-c o") 'insert-a-blank-line)
(global-set-key (kbd "C-x C-c") 'quit-emacs)
;; new *scratch* buffer keybing conflict with org-mode
(global-set-key (kbd "C-x 4 n") 'create-scratch-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "C-x w") 'toggle-truncate-line)
;; new line
(global-set-key (kbd "C-c y") "\C-a\C- \C-n\M-w\C-y")
(global-set-key (kbd "C-c -") 'buffer/clear)
(global-set-key (kbd "C-c d") (lambda () (interactive) (dired ".")))
(global-set-key (kbd "C-x j") 'json-pretty-print-buffer)
(global-set-key (kbd "C-c C-b") 'dos2unix)

(provide 'shortcuts)
;;; shortcuts.el ends here
