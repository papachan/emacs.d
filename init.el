;;; init.el --- Summary. -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version< emacs-version "30")
  (error "This config requires at least GNU Emacs 30, but you're running %s" emacs-version))

;;; Warning display -----------------------------------------------------
;; `lexical-binding': Emacs warns about third-party packages that lack
;; lexical-binding. Because end users cannot easily fix upstream source code,
;; these warnings create noise without providing actionable value.
;;
;; `warning-minimum-level' raises the bar for *popping up* the *Warnings*
;; buffer: anything below :error is still logged there, it just no longer
;; steals focus.  `warning-suppress-types' goes further and stops the
;; listed warning types from being displayed at all.
(setq warning-minimum-level :error)
(setq warning-suppress-types '((defvaralias) (lexical-binding)))
(setq warning-inhibit-types '((files missing-lexbind-cookie)))

;; prefer newer non-byte compiled sources to older byte compiled ones
(setq load-prefer-newer t)

(defun add-pkg (pkg-name)
  (let ((n (file-name-as-directory
            (concat (file-name-directory
                     (or (buffer-file-name) load-file-name))
                    pkg-name))))
    (add-to-list 'load-path n)))

(mapc 'add-pkg '("papachan" "lib"))

(defvar papachan/init-modules '(init-repo
                                misc
                                appearance
                                functions
                                init-org
                                setup-cider
                                setup-clojure
                                setup-chatgpt
                                setup-dired
                                setup-dired-sidebar
                                setup-dotnet
                                setup-helm
                                setup-ibuffer
                                setup-lsp-mode
                                setup-magit
                                setup-multiple-cursors
                                setup-projectile
                                setup-swiper
                                setup-webmode
                                setup-eshell
                                setup-undotree
                                setup-lisp
                                setup-iflipb
                                setup-idle-highlight
                                setup-eros
                                setup-python
                                setup-yasnippet
                                shortcuts))
(dolist (module papachan/init-modules)
  (condition-case err
      (require module)
    (error
     (message "Failed to load module \"%s\": %s " module err))))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
