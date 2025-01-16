;;; misc.el --- Summary
;;; Commentary:
;;; Code:
(require 'expand-region)
(require 'window-numbering) ;; Kill buffers which haven't been modified in a while
(require 'midnight)
(require 'whitespace)
(require 'ido)
(require 'recentf)
(require 'move-text)

;; (setq inhibit-startup-screen t)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; local env
(setenv "LC_CTYPE" "en_US.UTF-8")
(set-language-environment "UTF-8")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config
  (setq whitespace-line-column 99) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail tab-mark)))

(if (fboundp 'desktop-save-mode)
    (desktop-save-mode 1))

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)

(window-numbering-mode 1) ;; in use

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

;; prevent vertical split
;; (setq split-height-threshold 999)
(setq split-height-threshold 4
      split-width-threshold 40
      split-window-preferred-function 'split-window-really-sensibly)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq vc-follow-symlinks t)

; electric mode
(electric-indent-mode +1)

; move-text
(move-text-default-bindings)

; tramp with ssh
(setq-default tramp-default-method "ssh")

;; ido-mode is like magic pixie dust!
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-max-prospects 10)

(setq-default ido-handle-duplicate-virtual-buffers 2)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; (setq show-paren-style 'expression) ; highlight entire expression
(setq show-paren-style 'parenthesis) ; highlight brackets
;; (setq show-paren-style 'mixed) ; highlight brackets if visible, else entire expression

;; enable auto pair
;; (electric-pair-mode 1)
;; (setq electric-pair-preserve-balance nil)

(setq-default compilation-read-command nil) ; compile in a status buffer

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; to ensure files have no trailing whitespace

(put 'dired-find-alternate-file 'disabled nil)

;; delete other windows when open multiple files
(add-hook 'emacs-startup-hook 'delete-other-windows)

(add-hook 'text-mode-hook 'goto-address-mode)

;; automatically scroll
(setq-default compilation-scroll-output t)

;; Emacs 27.1
;; Fix performance problem with long lines files
(global-so-long-mode 1)
(setq bidi-inhibit-bpa t)
(setq bidi-paragraph-direction 'left-to-right)

(provide 'misc)
;;; misc.el ends here
