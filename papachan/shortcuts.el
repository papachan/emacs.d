;;; shortcuts.el file
;;
(require 'visual-regexp)

(define-key key-translation-map [dead-circumflex] "^")
(define-key key-translation-map [dead-grave] "`")

(global-set-key (kbd "M-g a") (lambda () (interactive) (insert "~")))
(global-set-key (kbd "M-g b") (lambda () (interactive) (insert "#")))
(global-set-key (kbd "C-x M-z") 'open-scratch-buffer)
(global-set-key (kbd "C-c C-o") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c -") 'buffer/clear)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c >") 'my-indent-region)
(global-set-key (kbd "C-c <") 'my-unindent-region)
(global-set-key [pause] 'toggle-current-window-dedication)
(global-set-key (kbd "C-c C-j") 'replace-string)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "s--") 'er/contract-region)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x j") 'json-pretty-print-buffer)
(global-set-key (kbd "C-c C-n") 'new-empty-buffer)
(global-set-key (kbd "C-c C-d") 'put-the-date)
(global-set-key (kbd "C-c w") 'select-whole-line)
(global-set-key (kbd "C-x q") 'shutdown-emacs)
(global-set-key (kbd "C-c o") 'insert-a-blank-line)
(global-set-key (kbd "C-c d") 'kill-whole-line)
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "M-H") 'common-lisp-hyperspec)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x C-c") 'quit-emacs)
(global-set-key (kbd "C-c f") 'follow-mode)
(global-set-key (kbd "C-x C-m") 'compile)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)
(global-set-key (kbd "C-x 4") 'split-window-right-and-move-there-dammit)
(global-set-key (kbd "C-x 5") 'twist-split)
(global-set-key (kbd "C-x n") 'create-scratch-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "S-<f1>") (lambda () (interactive) (dired "~/")))
(global-set-key (kbd "S-<f2>") (lambda () (interactive) (dired "~/.emacs.d/")))
(global-set-key (kbd "S-<f3>") (lambda () (interactive) (dired "~/git/documents/")))
(global-set-key (kbd "S-<f4>") (lambda () (interactive) (dired "~/Dropbox/")))
(global-set-key (kbd "S-<f5>") (lambda () (interactive) (dired "~/Downloads")))
(global-set-key (kbd "<f6>") 'reload-init-file)
(global-set-key (kbd "<f9>") 'iflipb-next-buffer)
(global-set-key (kbd "<f8>") 'iflipb-previous-buffer)
(global-set-key (kbd "C-c n") 'my-dired-create-file)
(global-set-key (kbd "C-<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "<f12>") 'run-cask-test)
;(global-set-key (kbd "<f12>") 'my-save-and-compile)
(global-set-key (kbd "C-c C-v") 'revert-buffer-without-confirmation)
(global-set-key (kbd "C-c a") 'my-increment-number-at-point)
(global-set-key (kbd "C-c x") 'my-decrement-number-at-point)
(global-set-key (kbd "C-c h") 'file-path-on-clipboard)
(global-set-key (kbd "C-c C-l") 'toggle-truncate-lines)
(global-set-key (kbd "C-'") 'toggle-quotes)
(global-set-key (kbd "C-c C-e") 'lispxmp)

;; comment line
(global-set-key (kbd "C-<f4>") (kbd "C-u 80 #"))
(global-set-key (kbd "C-<f5>") 'Lorem-ipsum-insert-paragraphs)
(global-set-key (kbd "C-<f6>") 'snippet-html)
(global-set-key (kbd "C-x M-d") 'insert-current-date)
(global-set-key (kbd "C-c i") 'snippet-latin)
(global-unset-key (kbd "C-z"))

(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c g") 'vr/mc-mark)

(provide 'shortcuts)
;;; shortcuts.el ends here
