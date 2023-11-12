;;; misc.el --- Summary
;;; Commentary:
;;; Code:

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

(provide 'misc)
;;; misc.el ends here
