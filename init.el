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
(require 'appearance)
(require 'bootstrap)
(require 'functions)
(require 'ido-snippet)
;; (require 'init-direnv)
(require 'init-flycheck)
(require 'init-org)
(require 'misc)
(require 'setup-autocomplete)
(require 'setup-cider)
(require 'setup-clojure)
(require 'setup-dired-sidebar)
(require 'setup-dired)
(require 'setup-eshell)
(require 'setup-font-system)
(require 'setup-gnus)
(require 'setup-groovy)
(require 'setup-helm)
(require 'setup-ibuffer)
(require 'setup-ivy)
(require 'setup-lisp)
;; (require 'setup-lsp)
(require 'setup-magit)
(require 'setup-markdown)
(require 'setup-multiple-cursors)
(require 'setup-projectile)
(require 'setup-python)
(require 'setup-smartmode)
(require 'setup-string-inflection)
(require 'setup-tabs)
(require 'setup-undo)
(require 'setup-webmode)
(require 'shortcuts)
(when (eq system-type 'darwin)
  (require 'init-osx-keys))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
