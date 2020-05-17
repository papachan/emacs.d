(dolist (package '(a
                   alchemist
                   all-the-icons
                   all-the-icons-dired
                   auto-complete
                   ansi
                   async
                   bind-key
                   cask
                   cider
                   clj-refactor
                   clojure-mode
                   color-theme
                   commander
                   company
                   composable
                   dash
                   dired-hacks-utils
                   dired-sidebar
                   dired-subtree
                   elfeed
                   elixir-mode
                   enh-ruby-mode
                   epl
                   erlang
                   expand-region
                   f
                   flycheck
                   flycheck-clj-kondo
                   flycheck-elixir
                   gh
                   git
                   git-commit
                   gnu-elpa-keyring-update
                   graphql-mode
                   haskell-emacs
                   haskell-mode
                   helm
                   helm-core
                   helm-posframe
                   helm-projectile
                   hl-todo
                   ht
                   htmlize
                   hydra
                   idle-highlight-mode
                   iflipb
                   inf-ruby
                   inflections
                   ivy
                   kotlin-mode
                   let-alist
                   logito
                   macrostep
                   magit
                   magit-gh-pulls
                   magit-org-todos
                   magit-todos
                   markdown-mode
                   marshal
                   maxframe
                   memoize
                   move-text
                   multiple-cursors
                   package-build
                   pallet
                   paredit
                   parseclj
                   parseedn
                   pcache
                   pcre2el
                   php-mode
                   pkg-info
                   popup
                   powerline
                   projectile
                   python-mode
                   pyvenv
                   queue
                   rg
                   rich-minority
                   s
                   seq
                   sesman
                   shut-up
                   slime
                   slime-company
                   smart-mode-line
                   smart-mode-line-powerline-theme
                   smartparens
                   spinner
                   swiper
                   transient
                   typescript-mode
                   undo-tree
                   use-package
                   visual-regexp
                   web-mode
                   wgrep
                   window-numbering
                   with-editor
                   xterm-color
                   yaml-mode
                   yasnippet
                   yasnippet-snippets))
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
