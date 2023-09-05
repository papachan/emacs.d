;;; misc.el file
(require 'expand-region)
(require 'window-numbering) ;; Kill buffers which haven't been modified in a while
(require 'midnight)
(require 'whitespace)
(require 'ido)
(require 'recentf)
(require 'move-text)

;; local env
(setenv "LC_CTYPE" "en_US.UTF-8")
(set-language-environment "UTF-8")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq whitespace-line-column 90
      whitespace-style '(tabs trailing tab-mark lines-tail))

;; (if (fboundp 'desktop-save-mode)
;;     (desktop-save-mode 1))

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)
(window-numbering-mode 1)

;; Always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Prevent lock files from creating.
(setq create-lockfiles nil)
(setq make-backup-files nil)

;; disable system beep
(setq visible-bell t)

;; Ignore case when searching
(setq case-fold-search t)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Number of characters until the fill column
(setq fill-column 80)

;; prevent vertical split
(setq split-height-threshold 999)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq vc-follow-symlinks t)

; electric mode
(electric-indent-mode +1)

; move-text
(move-text-default-bindings)

; tramp with ssh
(setq tramp-default-method "ssh")

;; toggle display of line numbers in the buffer.
(display-line-numbers-mode -1)
;; toggle display-line-numbers mode in all buffers.
(global-display-line-numbers-mode)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; (setq show-paren-style 'expression) ; highlight entire expression
(setq show-paren-style 'parenthesis) ; highlight brackets
;; (setq show-paren-style 'mixed) ; highlight brackets if visible, else entire expression

;; enable auto pair
;; (electric-pair-mode 1)
;; (setq electric-pair-preserve-balance nil)

(setq compilation-read-command nil) ; compile in a status buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; to ensure files have no trailing whitespace

(put 'dired-find-alternate-file 'disabled nil)

;; delete other windows when open multiple files
(add-hook 'emacs-startup-hook 'delete-other-windows)

(add-hook 'text-mode-hook 'goto-address-mode)

;; automatically scroll
(setq compilation-scroll-output t)

;; Emacs 27.1
;; Fix performance problem with long lines files
(global-so-long-mode 1)
(setq bidi-inhibit-bpa t)
(setq bidi-paragraph-direction 'left-to-right)

(provide 'misc)
;;; misc.el ends here
