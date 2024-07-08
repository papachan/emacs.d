;;; shortcuts.el file -- Summary
;;; Commentary:

;;; Code:
(require 'visual-regexp)
(require 'expand-region)

(global-set-key (kbd "C-x C-;") 'comment-region)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-<next>") 'next-buffer)
(global-set-key (kbd "C-<prior>") 'previous-buffer)
(global-set-key (kbd "C-c y") "\C-a\C- \C-n\M-w\C-y");; new line
(global-set-key (kbd "M-g q") 'mark-sexp)
(global-set-key (kbd "C-x 5 n") 'make-frame-command) ;; new frame
(global-set-key (kbd "C-x 5 3") 'gnus-other-frame)
(global-set-key (kbd "C-c C-o") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c -") 'buffer/clear)
(global-set-key (kbd "C-c >") 'my-indent-region)
(global-set-key (kbd "C-c <") 'my-unindent-region)
(global-set-key [pause] 'toggle-current-window-dedication)
(global-set-key (kbd "C-c C-j") 'replace-string)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x j") 'json-pretty-print-buffer)
(global-set-key (kbd "C-c w") 'select-whole-line)
(global-set-key (kbd "C-c o") 'insert-a-blank-line)
(global-set-key (kbd "C-x c d") (lambda () (interactive) (dired ".")))
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x C-c") 'quit-emacs)
(global-set-key (kbd "C-c f") 'follow-mode)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)
(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)
(global-set-key (kbd "C-x 6") 'twist-split)
;; new *scratch* buffer keybing conflict with org-mode
(global-set-key (kbd "C-x 4 n") 'create-scratch-buffer)
(global-set-key (kbd "C-x 4 ,") 'new-org-mode-buffer)
(global-set-key (kbd "C-c C-n") 'new-empty-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
;; (global-set-key (kbd "S-<f1>") (lambda () (interactive) (dired "~/")))
(global-set-key (kbd "S-<f2>") (lambda () (interactive) (dired "~/.emacs.d"))) ;; replace auto-scrolling shortcut
;; (global-set-key (kbd "S-<f3>") (lambda () (interactive) (dired "~/Dropbox/documents/")))
(global-set-key (kbd "S-<f4>") (lambda () (interactive) (dired "~/Dropbox")))
(global-set-key (kbd "S-<f5>") (lambda () (interactive) (dired "~/Downloads")))
(global-set-key (kbd "<f8>") 'repeat-complex-command)
(global-set-key (kbd "C-c v") 'revert-buffer-without-confirmation)
(global-set-key (kbd "C-c a") 'my-increment-number-at-point)
(global-set-key (kbd "C-c x") 'my-decrement-number-at-point)
(global-set-key (kbd "C-c h") 'file-path-on-clipboard)
(global-set-key (kbd "C-c C-l") 'toggle-truncate-lines)
(global-set-key (kbd "C-'") 'toggle-quotes)
(global-set-key (kbd "C-c <backspace>") 'join-line*)
(global-set-key (kbd "C-c <deletechar>") 'fixup-whitespace)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(global-set-key (kbd "C-c %") 'query-replace-regexp)
(global-set-key (kbd "C-c C-v") 'other-frame)

(global-set-key (kbd "M-g 1") (lambda () (interactive) (insert-into-buffer "~/tmp/gitconfig.txt")))
(global-set-key (kbd "M-g 2") (lambda () (interactive) (insert-into-buffer "~/tmp/gitconfig-papachan.txt")))

(global-set-key (kbd "C-c f") 'reopen-last-closed-file)
(provide 'shortcuts)
;;; shortcuts.el ends here
