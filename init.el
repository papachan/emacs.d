;;; init.el --- --- user init file  -*- no-byte-compile: t -*-
;;;
;;;
(require 'package)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; initializing pallet
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq dotemacs-dir user-emacs-directory)
(setq dotemacs-cache-dir (expand-file-name ".cache" dotemacs-dir))

; add lisp files directory
(setq dotfiles-lisp-dir
      (file-name-as-directory
       (concat (file-name-directory
                (or (buffer-file-name) load-file-name))
               "papachan")))
(add-to-list 'load-path dotfiles-lisp-dir)

(package-initialize)

(require 'use-package)

(dolist (file '("misc"
                "personal"
                "snippet"
                "erlang"
                "github"
                "appearance"
                "setup-python"
                "setup-cider"
                "setup-magit"
                "init-eshell"
                "ido-snippet"
                "webmode"))
  (load (concat dotfiles-lisp-dir file)))

; emacs-server
(require 'server)
(unless (server-running-p)
  (server-start))

; paths
(progn (cd "~/.emacs.d/")
    (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.4.0")
(add-to-list 'load-path "~/.emacs.d/lib")

; default HOME directory
(setq default-directory (f-full (getenv "HOME")))

(when (memq window-system '(mac ns))
  (add-to-list 'exec-path "/usr/bin"))

(require 'expand-region)
(require 'frame-cmds)
(require 'smex)
(smex-initialize)

(load "restclient")
(load "iflipb")
(load "directory-files-recursive")
(load "twittering-mode")
(load "fill-column-indicator")

(setq make-backup-files nil)

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
(require 'smart-mode-line)
;; Setup Smart Model Line
(defun smart-mode-line-init()
    (setq sml/theme 'dark)
    (setq sml/theme 'powerline)
    (sml/setup)
    (setq sml/no-confirm-load-theme t))
(add-hook 'after-init-hook #'smart-mode-line-init)

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

(if (fboundp 'desktop-save-mode)
    (desktop-save-mode 1))

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

(display-time)

; helm
(add-to-list 'load-path "~/vendor/helm")
(require 'helm-config)

; quicklisp sbcl
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
; delete other windows when open multiple files
(add-hook 'emacs-startup-hook 'delete-other-windows)

(setq make-backup-files nil)

;; autocomplete  git@github.com:auto-complete/auto-complete.git
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories 
             "~/.emacs.d/vendor/auto-complete-1.4.0/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; enabling fill-column-indicator
(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

(require 'saveplace)
(setq-default save-place t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;(require 'org-latex)
;(setq org-export-latex-listings t)
;(add-to-list 'org-export-latex-packages-alist '("" "listings"))
;(add-to-list 'org-export-latex-packages-alist '("" "color"))
(setq latex-run-command "pdflatex")

; erlang lisp mode
; (defvar lfe-dir (concat (getenv "HOME") "~/dev/lfe-master/emacs"))
; (setq load-path (cons lfe-dir load-path))
; (require 'lfe-mode)
(require 'lfe-start)

; projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

; compile in a status buffer
(setq compilation-read-command nil)
; make shell interactive
(setq shell-command-switch "-ic")

;; ruby robe-mode
(add-hook 'ruby-mode-hook 'robe-mode)

(put 'dired-find-alternate-file 'disabled nil)
