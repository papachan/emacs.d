;;; init.el --- Summary
;;; Commentary:
;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version< emacs-version "30")
  (error "This config requires at least GNU Emacs 30, but you're running %s" emacs-version))

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
