;;; init.el --- Summary
;;; Commentary:
;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version< emacs-version "27")
  (error "This config requires at least GNU Emacs 27, but you're running %s" emacs-version))

(defun add-pkg (pkg-name)
  (let ((n (file-name-as-directory
            (concat (file-name-directory
                     (or (buffer-file-name) load-file-name))
                    pkg-name))))
    (add-to-list 'load-path n)))

;; add papachan directory to path
(mapcar 'add-pkg '("papachan"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remove cl deprecated warnings
(setq byte-compile-warnings '(cl-functions))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'init-repo)
(require 'setup-dired-sidebar)
(require 'setup-ibuffer)
(require 'setup-webmode)
(require 'ido-snippet)
(require 'setup-helm)
(require 'setup-clojure)
(require 'setup-magit)
(require 'setup-cider)
(require 'functions)
(require 'shortcuts)
(require 'appearance)
(require 'setup-multiple-cursors)
(require 'ido-snippet)
(require 'setup-swiper)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package eshell
  :bind (("C-x t e" . eshell)
         ("C-x t E" . eshell-new)))

(use-package undo-tree
  :commands global-undo-tree-mode
  :diminish undo-tree-mode
  :bind ("C-z" . undo-tree-visualize)
  :init
  (global-undo-tree-mode))

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; to ensure files have no trailing whitespace

(setq whitespace-line-column 90
      whitespace-style '(tabs trailing tab-mark lines-trail))

(if (fboundp 'desktop-save-mode)
    (desktop-save-mode 1))

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

(setq create-lockfiles nil)
(setq make-backup-files nil)

;; require a final newline
(setq require-final-newline t)

(column-number-mode)

(mouse-wheel-mode t)
(blink-cursor-mode -1)

; move-text
(move-text-default-bindings)

(recentf-mode 1)
(setq recentf-max-menu-items 10)
(setq recentf-max-saved-items 10)

;; Always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Prevent lock files from creating.
(setq create-lockfiles nil)
(setq make-backup-files nil)

(scroll-bar-mode 1)
(menu-bar-mode -1)
(tool-bar-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(electric-indent-mode +1)
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)
(window-numbering-mode 1)
; move-text
(move-text-default-bindings)
;; Highlight current line
(global-hl-line-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
