;;; init.el --- Summary
;;; Commentary:
;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version< emacs-version "28")
  (error "This config requires at least GNU Emacs 28, but you're running %s" emacs-version))

(defun add-pkg (pkg-name)
  (let ((n (file-name-as-directory
            (concat (file-name-directory
                     (or (buffer-file-name) load-file-name))
                    pkg-name))))
    (add-to-list 'load-path n)))

;; add papachan directory to path
(mapcar 'add-pkg '("papachan"))

(defvar init-directory (file-name-directory (expand-file-name "~/.emacs.d/init.el")))
(mapc 'load (file-expand-wildcards (concat init-directory "papachan/*.el")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun eshell-new ()
  (interactive)
  (eshell t))

(use-package eshell
  :bind (("C-x t e" . eshell)
         ("C-x t E" . eshell-new)))

(use-package undo-tree
  :commands global-undo-tree-mode
  :diminish undo-tree-mode
  :bind ("C-z" . undo-tree-visualize)
  :config
  (setq undo-tree-auto-save-history nil)
  :init
  (global-undo-tree-mode))

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; to ensure files have no trailing whitespace

(setq ring-bell-function 'ignore)

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
(tool-bar-mode -1)

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

(use-package idle-highlight-mode
  :config (setq idle-highlight-idle-time 0.2)
  :hook ((prog-mode text-mode) . idle-highlight-mode))

(use-package iflipb
  :ensure t
  :bind
  ("<f8>" . iflipb-next-buffer)
  ("<f7>" . iflipb-previous-buffer))

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (paredit-mode +1)
                                  (company-mode +1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
