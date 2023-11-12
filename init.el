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

(require 'init-repo)
(require 'misc)
(require 'appearance)
(require 'functions)
;; (require 'ido-snippet)
(require 'setup-cider)
(require 'setup-clojure)
(require 'setup-dired-sidebar)
(require 'setup-dotnet)
(require 'setup-helm)
(require 'setup-ibuffer)
(require 'setup-lsp-mode)
(require 'setup-magit)
(require 'setup-multiple-cursors)
(require 'setup-projectile)
(require 'setup-swiper)
(require 'setup-webmode)
(require 'setup-eshell)
(require 'setup-undotree)
(require 'setup-lisp)
(require 'setup-iflipb)
(require 'setup-idle-highlight)
(require 'shortcuts)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
