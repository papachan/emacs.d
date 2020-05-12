(dolist (package '(alchemist
                   all-the-icons
                   clj-refactor
                   cider
                   clojure-mode
                   color-theme
                   composable
                   dired-sidebar
                   dired-subtree
                   dired-hacks-utils
                   elfeed
                   elixir-mode
                   enh-ruby-mode
                   erlang
                   expand-region
                   flycheck-clj-kondo
                   flycheck-elixir
                   flycheck
                   gnu-elpa-keyring-update
                   graphql-mode
                   haskell-emacs
                   haskell-mode
                   helm-projectile
                   helm
                   helm-core
                   htmlize
                   hydra
                   idle-highlight-mode
                   iflipb
                   inf-ruby
                   inflections
                   kotlin-mode
                   let-alist
                   magit-gh-pulls
                   gh
                   logito
                   magit-org-todos
                   magit-todos
                   magit
                   git-commit
                   hl-todo
                   markdown-mode
                   marshal
                   ht
                   maxframe
                   memoize
                   move-text
                   multiple-cursors
                   paredit
                   parseedn
                   parseclj
                   a
                   pcache
                   pcre2el
                   php-mode
                   popup
                   projectile
                   pkg-info
                   pyvenv
                   queue
                   rg
                   seq
                   sesman
                   slime-company
                   company
                   slime
                   macrostep
                   smart-mode-line-powerline-theme
                   smart-mode-line
                   rich-minority
                   powerline
                   smartparens
                   spinner
                   swiper
                   ivy
                   transient
                   typescript-mode
                   undo-tree
                   visual-regexp
                   web-mode
                   wgrep
                   window-numbering
                   with-editor
                   async
                   xterm-color
                   yaml-mode
                   yasnippet-snippets
                   yasnippet
                   commander
                   git
                   pallet
                   cask
                   ansi
                   package-build
                   epl
                   f
                   dash
                   s
                   shut-up
                   use-package
                   bind-key)))

(progn (package-refresh-contents)
       (package-install-selected-packages)
       (byte-recompile-directory package-user-dir nil 'force))

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

(dolist (package-name package-activated-list)
  (package-install package-name))


(dolist (package '(clojure-mode
                   color-theme
                   composable
                   dired-sidebar
                   dired-subtree
                   dired-hacks-utils
                   elfeed
                   elixir-mode
                   enh-ruby-mode
                   erlang
                   expand-region
                   flycheck-clj-kondo
                   flycheck-elixir
                   flycheck
                   helm-projectile
                   helm-core
                   htmlize
                   hydra
                   idle-highlight-mode
                   iflipb
                   inf-ruby
                   inflections
                   kotlin-mode
                   let-alist
                   magit-gh-pulls
                   gh
                   logito
                   git-commit
                   markdown-mode
                   marshal
                   maxframe
                   memoize
                   move-text
                   multiple-cursors
                   paredit
                   parseedn
                   parseclj
                   a
                   pcache
                   pcre2el
                   php-mode
                   popup
                   projectile
                   pkg-info
                   pyvenv
                   queue
                   rg
                   seq
                   sesman
                   slime-company
                   company
                   macrostep
                   smart-mode-line-powerline-theme
                   smart-mode-line
                   rich-minority
                   powerline
                   smartparens
                   spinner
                   swiper
                   ivy
                   transient
                   typescript-mode
                   undo-tree
                   visual-regexp
                   web-mode
                   wgrep
                   window-numbering
                   with-editor
                   async
                   xterm-color
                   yaml-mode
                   yasnippet-snippets
                   commander
                   git
                   cask
                   ansi
                   package-build
                   epl
                   dash
                   shut-up
                   origami))
  (package-install package))
