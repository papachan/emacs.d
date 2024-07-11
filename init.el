;;; init.el --- -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(when (version< emacs-version "28")
  (error "This config requires at least GNU Emacs 28, but you're running %s" emacs-version))

;; prefer newer non-byte compiled sources to older byte compiled ones
(setq load-prefer-newer t)

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
(require 'project)

(define-key ctl-x-map "p" project-prefix-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar init-directory (file-name-directory (expand-file-name "~/.emacs.d/init.el")))
(defun add-pkg (pkg-name)
  (let ((n (file-name-as-directory
            (concat (file-name-directory
                     (or (buffer-file-name) load-file-name))
                    pkg-name))))
    (add-to-list 'load-path n)))
;; (mapc 'load (file-expand-wildcards (concat init-directory "papachan/*.el")))
(mapcar 'add-pkg '("papachan" "lib"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (fboundp 'desktop-save-mode)
    (desktop-save-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'appearance)
(require 'misc)
(require 'functions)
(require 'ido-snippet)
(require 'setup-cider)
(require 'setup-clojure)
(require 'setup-company)
(require 'setup-dired-sidebar)
(require 'setup-font-system)
(require 'setup-helm)
(require 'setup-ibuffer)
(require 'setup-iflipb)
(require 'setup-chatgpt)
;; (require 'setup-ivy)
(provide 'init-flycheck)
(require 'setup-lisp)
(require 'setup-lsp-mode)
(require 'setup-magit)
(require 'setup-multiple-cursors)
(require 'setup-projectile)
(require 'setup-shell)
(require 'setup-web)
(require 'setup-idle-highlight)
(require 'init-undo-tree)
(require 'shortcuts)
(require 'setup-eshell)
(require 'setup-eros)
