;; -*- lexical-binding: t; -*-
;;; init.el --- --- user init file
;;; commentary:
;;; code:

(when (version< emacs-version "29")
  (error "This config requires at least GNU Emacs 29, but you're running %s" emacs-version))

(setq load-prefer-newer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defvar init-directory (file-name-directory (expand-file-name "~/.emacs.d/init.el")))

(defun add-pkg (pkg-name)
  (let ((n (file-name-as-directory
            (concat (file-name-directory
                     (or (buffer-file-name) load-file-name))
                    pkg-name))))
    (add-to-list 'load-path n)))

(mapc 'add-pkg '("papachan" "lib"))

(require 'init-repo)
(require 'init-org)
(require 'appearance)
(require 'setup-helm)
(require 'ido-snippet)
(require 'init-flycheck)
(require 'misc)
(require 'functions)
(require 'setup-font-system)
(require 'setup-multiple-cursors)
(require 'setup-magit)
(require 'setup-lisp)
(require 'setup-lsp-mode)
(require 'setup-dired-sidebar)
(require 'setup-eshell)
(require 'setup-ibuffer)
(require 'setup-dired)
(require 'setup-cider)
(require 'setup-ivy)
(require 'setup-idle-highlight)
(require 'setup-web)
;; (require 'setup-autocomplete)
(require 'setup-projectile)
(require 'setup-company)
(require 'setup-clojure)
(require 'setup-iflipb)
(require 'setup-eros)
(require 'setup-chatgpt)
(require 'setup-yasnippet)
(require 'shortcuts)

(setq warning-minimum-level :emergency)

(provide 'init)
;;; init.el ends here
