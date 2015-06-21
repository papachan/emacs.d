;;; init.el --- --- user init file  -*- no-byte-compile: t -*-
;;;
;;;
(require 'package)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-to-list 'load-path "~/.emacs.d/papachan")
(load "misc")
(load "personal")
(load "snippet")
(load "erlang")
(load "github")

(require 'server)
(unless (server-running-p)
  (server-start))

;; initializing pallet
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

; paths
(progn (cd "~/.emacs.d/")
    (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/vendor/cider-0.8.2")
;(add-to-list 'load-path "~/.emacs.d/vendor/smart-mode-line-2.8")
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.4.0")
(add-to-list 'load-path "~/.emacs.d/lib")

(setq default-directory (f-full (getenv "HOME")))

(require 'frame-cmds)
(require 'smex)
(smex-initialize)

(load "restclient")
(load "twittering-mode")
(load "iflipb")

(setq make-backup-files nil)

;; Scrollbar + Line numbers + Menu Bar
(scroll-bar-mode 1)
(linum-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
;(global-linum-mode)
;(global-font-lock-mode 1)
(column-number-mode)
;(global-whitespace-mode)

(require 'window-numbering)
(window-numbering-mode 1)

(require 'whitespace)
(setq whitespace-line-column 90
      whitespace-style '(tabs trailing tab-mark lines-tail))

; smart-mode-line
;(require 'smart-mode-line)
;; Setup Smart Model Line
;(defun smart-mode-line-init()
;    (setq sml/theme 'dark)
;    (sml/setup))
;(add-hook 'after-init-hook #'smart-mode-line-init)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Ignore case when searching
(setq case-fold-search t)

;; Don't show the startup screen
;; (setq inhibit-startup-screen t)
;; (setq inhibit-startup-message t)

;; Number of characters until the fill column
(setq fill-column 80)

;; prevent vertical split
(setq split-height-threshold 999)

(if (fboundp 'desktop-save-mode) (desktop-save-mode 1))
(setq vc-follow-symlinks t)

;; ido-mode is like magic pixie dust!
(require 'ido)
(ido-mode t)
;; (ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(defalias 'yes-or-no-p 'y-or-n-p)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  ;; http://www.nongnu.org/color-theme/
  ;(add-to-list 'load-path "/vendores/color-theme-6.6.0/color-theme.el")
  (require 'color-theme)
  (load-file "~/.emacs.d/vendor/zenburn/zenburn.el"))

(require 'cider)

; slime-helper
;(load (expand-file-name ("~/quicklisp/slime-helper.el")))
; quicklip sbcl
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup '(slime-fancy))

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
; delete other windows when open multiple files
(add-hook 'emacs-startup-hook 'delete-other-windows)

(setq make-backup-files nil)

;; autocomplete  git@github.com:auto-complete/auto-complete.git
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; python mode
(setq py-install-directory "~/.emacs.d/python-mode.el-6.2.0")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;(require 'org-latex)
;(setq org-export-latex-listings t)
;(add-to-list 'org-export-latex-packages-alist '("" "listings"))
;(add-to-list 'org-export-latex-packages-alist '("" "color"))
(setq latex-run-command "pdflatex")

; activate company-mode
; (add-hook 'after-init-hook 'global-company-mode)

; erlang lisp mode
; (defvar lfe-dir (concat (getenv "HOME") "/home/papachan/dev/lfe-master/emacs"))
; (setq load-path (cons lfe-dir load-path))
; (require 'lfe-mode)
(require 'lfe-start)

(bind-key
 "C-x C-c"
 (lambda ()
   (interactive)
   (if (y-or-n-p "Quit Emacs? ")
       (save-buffers-kill-emacs))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7fde61efa16011b294db1448de9e0ae45d602ae949a640164bce6fece4420e90" "47e9350059e9a61ac89a695eec2d050e67a9e93ade5617a499843e1956c66f59" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
