(dolist (package '(all-the-icons-dired
                   all-the-icons
                   anakondo
                   auto-complete
                   cask
                   ansi
                   clj-refactor
                   clojure-mode-extra-font-locking
                   color-theme
                   commander
                   composable
                   dired-sidebar
                   dired-subtree
                   dired-hacks-utils
                   direnv
                   expand-region
                   flycheck-clj-kondo
                   flycheck
                   git
                   git-timemachine
                   groovy-mode
                   helm-cider
                   cider
                   clojure-mode
                   helm-posframe
                   helm
                   helm-core
                   htmlize
                   hydra
                   idle-highlight-mode
                   iflipb
                   inflections
                   lsp-mode
                   f
                   dash-functional
                   lv
                   magit-gh-pulls
                   magit
                   git-commit
                   gh
                   logito
                   markdown-mode
                   marshal
                   ht
                   maxframe
                   memoize
                   move-text
                   multiple-cursors
                   origami
                   dash
                   package-build
                   paredit
                   parseedn
                   parseclj
                   a
                   pcache
                   pcre2el
                   php-mode
                   popup
                   posframe
                   projectile
                   pkg-info
                   epl
                   python-mode
                   queue
                   rg
                   sesman
                   shell-pop
                   shut-up
                   slime-company
                   company
                   slime
                   macrostep
                   smart-mode-line-powerline-theme
                   smart-mode-line
                   rich-minority
                   powerline
                   spinner
                   string-inflection
                   swiper
                   ivy
                   transient
                   typescript-mode
                   undo-tree
                   use-package
                   bind-key
                   visual-regexp
                   vterm
                   web-mode
                   wgrep
                   window-numbering
                   with-editor
                   async
                   xterm-color
                   yaml-mode
                   yasnippet-snippets
                   s
                   yasnippet))
  (package-install package))

;; (progn (package-refresh-contents)
;;        (package-install-selected-packages)
;;        (byte-recompile-directory package-user-dir nil 'force))

(defun package-reinstall-all-activated-packages ()
  "Refresh and reinstall all activated packages."
  (interactive)
  (package-refresh-contents)
  (dolist (package-name package-activated-list)
    (when (package-installed-p package-name)
      (unless (ignore-errors                   ;some packages may fail to install
                (package-reinstall package-name))
        (warn "Package %s failed to reinstall" package-name)))))

(dolist (package-name package-activated-list)
  (message "%S" package-name))

;; (dolist (package-name package-activated-list)
;;   (package-install package-name))
