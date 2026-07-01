;;; init.el --- -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(when (version< emacs-version "30")
  (error "This config requires at least GNU Emacs 30, but you're running %s" emacs-version))

;; prefer newer non-byte compiled sources to older byte compiled ones
(setq load-prefer-newer t)

(setq package-enable-at-startup t)

(setq package-vc-register-as-project nil)

(require 'package)

(dolist (source ' (("gnu" . "http://elpa.gnu.org/packages/")
                   ("melpa" . "https://melpa.org/packages/")
                   ("melpa-stable" . "http://stable.melpa.org/packages/")))
  (add-to-list 'package-archives source t))

(setq package-archive-priorities
      '(("gnu" . 1)
        ("melpa-stable" . 2)
        ("melpa" . 3)))

(package-initialize)

(define-key ctl-x-map "p" project-prefix-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar init-directory (file-name-directory (expand-file-name "~/.emacs.d/init.el")))
(defun add-pkg (pkg-name)
  (let ((n (file-name-as-directory
            (concat (file-name-directory
                     (or (buffer-file-name) load-file-name))
                    pkg-name))))
    (add-to-list 'load-path n)))

(mapcar 'add-pkg '("papachan" "lib"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar papachan/init-modules '(appearance
                                misc
                                functions
                                ido-snippet
                                setup-cider
                                setup-clojure
                                setup-company
                                setup-dired
                                ;; setup-dired-sidebar
                                setup-font-system
                                setup-helm
                                setup-ibuffer
                                setup-iflipb
                                setup-chatgpt
                                init-flycheck
                                setup-lisp
                                setup-magit
                                setup-multiple-cursors
                                setup-projectile
                                setup-shell
                                setup-web
                                ;; setup-python
                                setup-idle-highlight
                                init-undo-tree
                                setup-eshell
                                setup-eros
                                setup-yasnippet
                                ;; setup-lsp-mode
                                shortcuts)
  "List of configuration modules to load.")

(dolist (module papachan/init-modules)
  (condition-case err
      (require module)
    (error
     (message "Failed to load module \"%s\": %s" module err))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (fboundp 'desktop-save-mode)
    (desktop-save-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
