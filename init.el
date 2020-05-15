;;; init.el --- --- user init file
;;;
;;;

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
(require 'setup-multiple-cursors)
(require 'setup-tabs)
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
(require 'setup-python)
(require 'setup-dired-sidebar)
(require 'setup-autocomplete)
(require 'shortcuts)
(require 'bootstrap)
(require 'toggle-quotes)
(require 'iflipb)
(require 'lorem-ipsum)
(require 'lispxmp)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
