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

; emacs-server
(require 'server)
(unless (server-running-p)
  (server-start))

(package-initialize)

(require 'use-package)

(dolist (file '("misc"
                "personal"
                "snippet"
                "erlang"
                "github"
                "text-editing"
                "appearance"
                "setup-ivy"
                "setup-cider"
                "setup-projectile"
                "setup-magit"
                "init-eshell"
                "ido-snippet"
                "setup-python"
                "webmode"
                "setup-smartmode"
                "unicode-emoticons"))
  (load (concat dotfiles-lisp-dir file)))

; paths
(progn (cd "~/.emacs.d/")
    (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.4.0")
(add-to-list 'load-path "~/.emacs.d/vendor/origami.el")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-neotree")
(add-to-list 'load-path "~/.emacs.d/vendor/x5o.el")
(add-to-list 'load-path "~/.emacs.d/lib")

; default HOME directory
(setq default-directory (f-full (getenv "HOME")))

(when (memq window-system '(mac ns))
  (add-to-list 'exec-path "/usr/bin"))

(require 'expand-region)
(require 'frame-cmds)
(require 'smex)
(smex-initialize)

(load "iflipb")
(load "directory-files-recursive")
(load "twittering-mode")
(load "fill-column-indicator")
(load "helm-aws")
(load "alert")

(setq make-backup-files nil)

(linum-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)
;; enable undo-tree
(global-undo-tree-mode)

;; disable system beep 
(setq visible-bell 1)

(require 'window-numbering)
(window-numbering-mode 1)

(require 'whitespace)
(setq whitespace-line-column 90
      whitespace-style '(tabs trailing tab-mark lines-tail))

;; Always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; mac settings
(cond
 ((string-equal system-type "darwin")
  (progn
    (windmove-default-keybindings)
    (setq x-select-enable-clipboard t))))

;; Ignore case when searching
(setq case-fold-search t)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

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

; helm
(add-to-list 'load-path "~/vendor/helm")
(require 'helm-config)

; restclient
(add-to-list 'load-path "~/vendor/restclient.el")
(require 'restclient)

; quicklisp sbcl
(add-to-list 'load-path "~/quicklisp")
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(custom-set-variables '(safe-local-variable-values (quote ((Syntax . Common-Lisp)))))

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
; delete other windows when open multiple files
(add-hook 'emacs-startup-hook 'delete-other-windows)

; electric mode
;(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))
(electric-indent-mode +1)

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
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(require 'saveplace)
(setq-default save-place t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(require 'org-latex)
(setq org-export-latex-listings t)
(add-to-list 'org-export-latex-packages-alist '("" "listings"))
(add-to-list 'org-export-latex-packages-alist '("" "color"))
(setq latex-run-command "pdflatex")

; erlang lisp mode
(defvar lfe-dir (concat (getenv "HOME") "~/dev/lfe-master/emacs"))
(setq load-path (cons lfe-dir load-path))
(require 'lfe-mode)
(require 'lfe-start)

; compile in a status buffer
(setq compilation-read-command nil)
; make shell interactive
(setq shell-command-switch "-ic")

;; ruby robe-mode
(add-hook 'ruby-mode-hook 'robe-mode)

(put 'dired-find-alternate-file 'disabled nil)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)