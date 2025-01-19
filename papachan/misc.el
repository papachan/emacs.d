;;; misc.el file
(require 'expand-region)
(require 'window-numbering) ;; Kill buffers which haven't been modified in a while
(require 'midnight)
(require 'whitespace)
(require 'recentf)
(require 'move-text)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package emacs
  :custom
  ;; disable system beep
  (setq visible-bell t)
  ;; Move files to trash when deleting
  (setq delete-by-moving-to-trash t))

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config
  (setq whitespace-line-column 90)
  (setq whitespace-style '(face tabs empty trailing lines-tail tab-mark)))

 ;; to ensure files have no trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; local env
(setenv "LC_CTYPE" "en_US.UTF-8")
(set-language-environment "UTF-8")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; (if (fboundp 'desktop-save-mode)
;;     (desktop-save-mode 1))

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)
(window-numbering-mode -1)

;; Always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Prevent lock files from creating.
(setq create-lockfiles nil)
(setq make-backup-files nil)

;; Ignore case when searching
(setq case-fold-search t)

;; Number of characters until the fill column
(setq fill-column 80)

;; prevent vertical split
;; (setq split-height-threshold 999)
(setq split-height-threshold 4
      split-width-threshold 40
      split-window-preferred-function 'split-window-really-sensibly)

(setq vc-follow-symlinks t)

; electric mode
(electric-indent-mode +1)

; move-text
(move-text-default-bindings)

; tramp with ssh
(setq tramp-default-method "ssh")

;; toggle display of line numbers in the buffer.
;; (display-line-numbers-mode -1)
;; toggle display-line-numbers mode in all buffers.
(global-display-line-numbers-mode nil)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; (setq show-paren-style 'expression) ; highlight entire expression
(setq show-paren-style 'parenthesis) ; highlight brackets
;; (setq show-paren-style 'mixed) ; highlight brackets if visible, else entire expression

;; enable auto pair
;; (electric-pair-mode 1)
;; (setq electric-pair-preserve-balance nil)

(setq compilation-read-command nil) ; compile in a status buffer

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

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (scroll-bar-mode -1)
  (display-time)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (column-number-mode)
  ;; Highlight current line
  (global-hl-line-mode 1)
  (window-numbering-mode 1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(provide 'misc)
;;; misc.el ends here
