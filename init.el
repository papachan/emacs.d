;;; init.el --- --- user init file
;;;
;;;
(when (version< emacs-version "24.1")
  (error "Prelude requires at least GNU Emacs 24.1, but you're running %s" emacs-version))

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
    (setq x-select-enable-clipboard t))))

;; autocomplete  git@github.com:auto-complete/auto-complete.git
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.4.0")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (concat user-emacs-directory "vendor/auto-complete-1.4.0/dict"))
(ac-config-default)
(setq ac-ignore-case nil)
(global-auto-complete-mode t)

(dolist (file '("misc"
                "personal"
                "shortcuts"
                "init-ibuffer"
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
                "unicode-emoticons"))
  (load (concat dotfiles-misc-dir file)))

; paths
(progn
  (cd dotemacs-dir)
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "vendor/origami.el")
(add-to-list 'load-path "vendor/emacs-neotree")
(add-to-list 'load-path "vendor/x5o.el")
(add-to-list 'load-path "vendor/slack")
(add-to-list 'load-path dotfiles-lisp-dir)
(add-to-list 'load-path "vendor/restclient.el")

(require 'restclient)
(require 'expand-region)
(require 'frame-cmds)
(require 'smex)
(smex-initialize)
(require 'bootstrap)
(download-elisp-files elisp-file-list)

;; load files from dotfiles-lisp-dir
(dolist (file '(
    "iflipb"
    "directory-files-recursive"
    "twittering-mode"
    "helm-aws"
    "lorem-ipsum"))
  (load file))

(linum-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)

(require 'window-numbering)
(window-numbering-mode 1)

;; Kill buffers which haven't been modified in a while
(require 'midnight)

(require 'whitespace)
(setq whitespace-line-column 90
      whitespace-style '(tabs trailing tab-mark lines-tail))

(if (fboundp 'desktop-save-mode)
    (desktop-save-mode 1))

;; ido-mode is like magic pixie dust!
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

; helm
(require 'helm-config)

; quicklisp sbcl
(add-to-list 'load-path (concat user-emacs-directory "quicklisp"))
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
; delete other windows when open multiple files
(add-hook 'emacs-startup-hook 'delete-other-windows)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))
(add-hook 'lisp-mode-hook #'enable-paredit-mode)

(if (version< "25.1" emacs-version)
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  ;(save-place-mode 1)
  )

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

; compile in a status buffer
(setq compilation-read-command nil)

(put 'dired-find-alternate-file 'disabled nil)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(use-package multiple-cursors
  :config
  (progn
    (setq mc/max-cursors 30)))

;; check emacs start time
(message "Emacs started in %ds"
         (destructuring-bind (hi lo ms ps) (current-time)
           (- (+ hi lo)
              (+ (first *emacs-load-start*)
                 (second *emacs-load-start*)))))

(custom-set-variables '(safe-local-variable-values (quote ((Syntax . Common-Lisp)))))

