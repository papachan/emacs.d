;;; shortcuts.el --- Summary
;;
(require 'visual-regexp)

;; Unset C-z
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-<next>") 'next-buffer)
(global-set-key (kbd "C-<prior>") 'previous-buffer)

(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") (lambda() (interactive) (other-window -1)))
(global-set-key (kbd "M-g q") 'mark-sexp)
(global-set-key (kbd "C-x 5 n") 'make-frame-command) ;; new frame
(global-set-key (kbd "C-x 5 3") 'gnus-other-frame)
(global-set-key (kbd "C-x 9") 'open-scratch-buffer)
(global-set-key (kbd "C-c C-o") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c -") 'buffer/clear)
(global-set-key (kbd "C-c >") 'my-indent-region)
(global-set-key (kbd "C-c <") 'my-unindent-region)
(global-set-key [pause] 'toggle-current-window-dedication)
(global-set-key (kbd "C-c C-j") 'replace-string)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-n") 'er/mark-word)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c w") 'select-whole-line)
(global-set-key (kbd "C-c o") 'insert-a-blank-line)
(global-set-key (kbd "C-x c d") (lambda () (interactive) (dired ".")))
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-x C-c") 'quit-emacs)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)
(global-set-key (kbd "C-x 6") 'twist-split)
(global-set-key (kbd "C-x C-;") 'comment-region)
(global-set-key (kbd "RET") 'newline-and-indent)
;; new *scratch* buffer keybing conflict with org-mode
(global-set-key (kbd "C-x 4 n") 'create-scratch-buffer)
(global-set-key (kbd "C-x 4 ,") 'new-org-mode-buffer)
(global-set-key (kbd "C-c C-n") 'new-empty-buffer)
(global-set-key (kbd "C-c h") 'file-path-on-clipboard)
(global-set-key (kbd "C-c C-l") 'toggle-truncate-lines)
(global-set-key (kbd "C-'") 'toggle-quotes)
(global-set-key (kbd "C-c <backspace>") 'join-line*)
(global-set-key (kbd "C-c <deletechar>") 'fixup-whitespace)
(global-set-key (kbd "C-c C-v") 'other-frame)
(global-set-key (kbd "C-x j") 'json-pretty-print-buffer)

(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c g") 'vr/mc-mark)

;; new line
(global-set-key (kbd "C-c y") "\C-a\C- \C-n\M-w\C-y")

(global-set-key (kbd "C-x k") 'kill-this-buffer)

(global-set-key (kbd "<pinch>") 'ignore)
(global-set-key (kbd "<C-wheel-up>") 'ignore)
(global-set-key (kbd "<C-wheel-down>") 'ignore)

(global-set-key (kbd "C-c f") 'reopen-last-closed-file)
(provide 'shortcuts)
;;; shortcuts.el ends here
