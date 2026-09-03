;;; shortcuts.el --- Shortcuts.  -*- lexical-binding: nil; -*-
;;; Commentary:

;;; Code:
(require 'toggle-quotes)
(require 'iflipb)

(use-package expand-region
  :ensure t
  ;; only er/expand-region and er/contract-region are autoloaded; er/mark-word
  ;; lives in er-basic-expansions and needs an explicit autoload.
  :commands (er/expand-region er/mark-word))

(use-package change-inner :ensure t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c =") 'er/expand-region)
(global-set-key (kbd "C-c h") 'kill-buffer-file-name-or-default-directory)
(global-set-key (kbd "M-n") 'er/mark-word)
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)
(global-set-key (kbd "C-c <deletechar>") 'fixup-whitespace)
(global-set-key (kbd "C-c w") 'select-whole-line)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "C-c C-o") 'delete-trailing-whitespace)
(global-set-key (kbd "C-c o") 'insert-a-blank-line)
(global-set-key (kbd "C-x C-c") 'quit-emacs)
(global-set-key (kbd "C-x 3") 'split-window-right-and-move-there-dammit)
;; new *scratch* buffer keybing conflict with org-mode
(global-set-key (kbd "C-x 4 n") 'create-scratch-buffer)
(global-set-key (kbd "C-x 5 n") 'make-frame-command)
;; this alias is redundant since Emacs 24.4 electric-indent-mode is on by default and already does this.
;; (global-set-key (kbd "RET") 'newline-and-indent)
;; new line alias
(global-set-key (kbd "C-c y") "\C-a\C- \C-n\M-w\C-y")
(global-set-key (kbd "C-c -") 'buffer/clear)
;; Dired
(global-set-key (kbd "C-x c d") 'current-directory)
(global-set-key (kbd "C-c i") 'copy-symbol-at-point)
(global-set-key (kbd "C-x j") 'json-pretty-print-buffer)
(global-set-key (kbd "C-c a") 'increment-number-at-point)
(global-set-key (kbd "C-c x") 'my-decrement-number-at-point)
(global-set-key (kbd "C-c f") 'reopen-last-closed-file)
(global-set-key (kbd "C-'") 'toggle-quotes)
(global-set-key (kbd "C-x g") 'simple-toggle-highlight-symbol-at-point)
(global-set-key (kbd "<C-tab>") 'iflipb-next-buffer)
(global-set-key (kbd "C-c <tab>") 'iflipb-previous-buffer)

(provide 'shortcuts)
;;; shortcuts.el ends here
