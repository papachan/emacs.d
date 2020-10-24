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
;; remove cl deprecated warnings
(setq byte-compile-warnings '(cl-functions))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'init-repo)
(require 'init-flycheck)
(require 'setup-multiple-cursors)
(require 'setup-gnus)
(require 'setup-tabs)
(require 'functions)
(require 'appearance)
(require 'misc)
(require 'setup-font-system)
(require 'setup-lisp)
(require 'setup-ivy)
(require 'setup-helm)
(require 'setup-smartmode)
(require 'setup-magit)
(require 'setup-cider)
(require 'setup-ibuffer)
(require 'setup-eshell)
(require 'setup-dired)
(require 'setup-python)
(require 'setup-dired-sidebar)
(require 'setup-autocomplete)
(require 'setup-undo)
(require 'shortcuts)
(require 'bootstrap)
(require 'toggle-quotes)
(require 'iflipb)
(require 'lorem-ipsum)
(require 'lispxmp)
(require 'setup-markdown)
(require 'init-org)
(require 'ido-snippet)
(require 'setup-webmode)
(require 'setup-projectile)
(require 'setup-groovy)
(require 'init-direnv)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
