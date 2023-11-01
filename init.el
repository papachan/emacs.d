;;; init.el --- --- user init file
;;;
;;;


(when (version<= emacs-version "28")
  (error "This config requires at least GNU Emacs 28, but you're running %s" emacs-version))
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
;; (require 'setup-groovy)
(require 'setup-helm)
(require 'setup-dotnet)
(require 'setup-ibuffer)
;; (provide 'setup-swiper)
(require 'setup-ivy)
(require 'setup-lisp)
;; (require 'setup-lsp)
(require 'setup-magit)
(require 'setup-markdown)
(require 'setup-multiple-cursors)
(require 'setup-projectile)
;; (require 'setup-python)
;; (require 'setup-smartmode)
(require 'setup-string-inflection)
(require 'setup-tabs)
(require 'setup-undo)
(require 'setup-webmode)
(require 'shortcuts)
(when (eq system-type 'darwin)
  (require 'init-osx-keys))

(use-package idle-highlight-mode
  :config (setq idle-highlight-idle-time 0.2)
  :hook ((prog-mode text-mode) . idle-highlight-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
