(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives 
             '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives 
             '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives 
             '("gnu" . "http://elpa.gnu.org/packages/"))
;; loading cider manually
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/vendor/cider")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/moe-theme-20141022.2156/moe-theme")
(add-to-list 'load-path "~/.emacs.d/elpa/moe-theme-20141022.2156/moe-theme")

(progn (cd "~/.emacs.d/")
    (normal-top-level-add-subdirs-to-load-path))

(set-default-font "Ubuntu Mono 14")
; (set-default-font "Liberation Mono 10")

;; Scrollbar + Line numbers + Menu Bar -- 2011.11.24
;(scroll-bar-mode 1)
;(linum-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
;(global-linum-mode)
;(global-font-lock-mode 1)
(column-number-mode)
;(global-whitespace-mode)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Always use spaces, not tabs, when indenting
(setq indent-tabs-mode nil)

;; Ignore case when searching
(setq case-fold-search t)

;; Don't show the startup screen
;; (setq inhibit-startup-screen t)

;; Number of characters until the fill column
(setq fill-column 80)

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

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (require 'color-theme)
  (load-file "~/.emacs.d/elpa/moe-theme-20141022.2156/moe-dark-theme.el"))
  ; sublime monokai theme
  ;(load-file "~/.emacs.d/elpa/monokai-theme-20140310.1330/monokai-theme.el"))


(require 'cider)

; slime-helper
;(load (expand-file-name ("~/quicklisp/slime-helper.el")))

; quicklip sbcl
(setq inferior-lisp-program "sbcl")


(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(setq make-backup-files nil)

;; autocomplete
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; python mode
(setq py-install-directory "~/.emacs.d/python-mode.el-6.2.0")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("7fde61efa16011b294db1448de9e0ae45d602ae949a640164bce6fece4420e90" "47e9350059e9a61ac89a695eec2d050e67a9e93ade5617a499843e1956c66f59" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
