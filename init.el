;;; init.el --- --- user init file
;;;
;;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (version< emacs-version "27")
  (error "This config requires at least GNU Emacs 27, but you're running %s" emacs-version))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun add-pkg (pkg-name)
  (let ((n (file-name-as-directory
            (concat (file-name-directory
                     (or (buffer-file-name) load-file-name))
                    pkg-name))))
    (add-to-list 'load-path n)))

(mapcar 'add-pkg '("papachan" "lib"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'init-repo)
(require 'functions)
(require 'appearance)
(require 'misc)
(require 'personal)
(require 'setup-lisp)
(require 'setup-ivy)
(require 'setup-helm)
(require 'setup-smartmode)
(require 'setup-magit)
(require 'setup-cider)
(require 'setup-eshell)
(require 'setup-dired)
(require 'shortcuts)
(require 'bootstrap)
(require 'toggle-quotes)
(require 'iflipb)
(require 'lorem-ipsum)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
