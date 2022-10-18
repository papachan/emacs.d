;;; init.el --- --- user init file
;;;
;;;

(when (version< emacs-version "28")
  (error "This config requires at least GNU Emacs 28, but you're running %s" emacs-version))

(require 'package)
(dolist (source '(("gnu" . "http://elpa.gnu.org/packages/")
                  ("melpa" . "https://melpa.org/packages/")
                  ("org" . "http://orgmode.org/elpa/")
                  ("melpa-stable" . "http://stable.melpa.org/packages/")))
  (add-to-list 'package-archives source t))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; update all packages
;; (setq use-package-always-ensure t)

(require 'use-package)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun add-pkg (pkg-name)
  (let ((n (file-name-as-directory
            (concat (file-name-directory
                     (or (buffer-file-name) load-file-name))
                    pkg-name))))
    (add-to-list 'load-path n)))

(mapcar 'add-pkg '("papachan" "lib"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (fboundp 'desktop-save-mode)
    (desktop-save-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(mapc 'load (file-expand-wildcards "~/.emacs.d/papachan/*.el"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; appearance.el
(load-file (expand-file-name "themes/zerodark-theme/zerodark-theme.el" user-emacs-directory))
(load-theme 'zerodark t)

(use-package all-the-icons
  :if (display-graphic-p))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq-default magit-process-password-prompt-regexps
;;   '("^\\(Enter \\)?[Pp]assphrase\\( for \\(RSA \\)?key '.*'\\)?: ?$"
;;     ;; Match-group 99 is used to identify the "user@host" part.
;;     "^\\(Enter \\)?[Pp]assword\\( for '\\(https?://\\)?\\(?99:.*\\)'\\)?: ?$"
;;     ;; Pinentry Curses box in the terminal when used with GnuPG
;;     "Please enter the passphrase for the ssh key"
;;     "^.*'s password: ?$"
;;     "^Yubikey for .*: ?$"
;;     "^Enter PIN for .*: ?$"))

;; web
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (scroll-bar-mode -1)
  (display-time)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (column-number-mode)
  (window-numbering-mode 1)
  ;; Highlight current line
  (global-hl-line-mode 1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))
