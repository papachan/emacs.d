;;; init.el --- --- user init file
;;;
;;;
(when (version< emacs-version "25.1")
  (error "This config requires at least GNU Emacs 25.1, but you're running %s" emacs-version))

(setq *emacs-load-start* (current-time))

(require 'package)

(setq dotemacs-dir user-emacs-directory)
(setq dotemacs-cache-dir (expand-file-name ".cache" dotemacs-dir))
(setq dotfiles-lisp-dir
      (expand-file-name "lib" dotemacs-dir))

;; initializing pallet
(require 'cask (concat (getenv "HOME") "/" ".cask/cask.el"))
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(cond ((file-directory-p
        (concat (getenv "HOME") "/" ".cask/bin"))
       (setenv "PATH"
        (concat (getenv "HOME") "/" ".cask/bin:" (getenv "PATH")))))

; add lisp files directory
(setq dotfiles-misc-dir
      (file-name-as-directory
       (concat (file-name-directory
                (or (buffer-file-name) load-file-name))
               "papachan")))
(add-to-list 'load-path dotfiles-misc-dir)

; emacs-server
(require 'server)
(unless (server-running-p)
  (server-start))

(package-initialize)

(require 'use-package)

; default HOME directory
(setq default-directory (f-full (getenv "HOME")))

;; osx settings
(cond
 ((equal system-type 'darwin)
  (progn
    (add-to-list 'exec-path "~/bin")
    (add-to-list 'exec-path "/usr/local/bin")
    (add-to-list 'exec-path "/usr/bin")
    (windmove-default-keybindings)
    (setq select-enable-clipboard t))))

;; (add-to-list 'load-path dotfiles-lisp-dir)
(add-to-list 'load-path "vendor/origami.el")
(add-to-list 'load-path "vendor/emacs-neotree")
(add-to-list 'load-path "vendor/x5o.el")
(add-to-list 'load-path "vendor/restclient.el")

(dolist (file '("setup-autocomplete"
                "misc"
                "personal"
                "shortcuts"
                "init-ibuffer"
                "init-elfeed"
                "setup-lisp"
                "setup-elixir"
                "setup-erlang"
                "github"
                "text-editing"
                "appearance"
                "setup-dired"
                "setup-ivy"
                "setup-cider"
                "setup-projectile"
                "setup-magit"
                "init-eshell"
                "init-org"
                "org-babel"
                "ido-snippet"
                "setup-python"
                "setup-ruby"
                "webmode"
                "setup-smartmode"
                "setup-multiple-cursors"
                "unicode-emoticons"))
  (load (concat dotfiles-misc-dir file)))

; paths
(progn
  (cd dotemacs-dir)
  (normal-top-level-add-subdirs-to-load-path))

;; load files from dotfiles-lisp-dir
(dolist (file '(
    "iflipb"
    "directory-files-recursive"
    "twittering-mode"
    "helm-aws"
    "lorem-ipsum"))
  (load file))

(require 'bootstrap)
(require 'restclient)
(require 'toggle-quotes)
(require 'lispxmp)
(require 'tea-time)
(require 'neotree)
(require 'wttrin)
(require 'linum)

(bootstrap)
(linum-mode)

; compile in a status buffer
(setq compilation-read-command nil)

;; check emacs start time
(message "Emacs started in %ds"
         (destructuring-bind (hi lo ms ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*)
                 (second *emacs-load-start*)))))

