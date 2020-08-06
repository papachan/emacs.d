-*- mode: markdown -*-
### Basic commands

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-h C-a</kbd> | help start screen
<kbd>C-g</kbd>| keyboard-quit
<kbd>C-x h TAB</kbd>| indent all lines
<kbd>C-x C-c</kbd>| Save-buffers-kill-emacs (exit emacs)
<kbd>M-[f10]</kbd>| toggle-frame-maximized
<kbd>C-[f11]</kbd>| Fullscreen
<kbd>C-x b</kbd>| switch to buffer
<kbd>C-x C-b</kbd>| ibuffers window
<kbd>C-j</kbd> | Open a new line and indent
<kbd>C-u 66 ;</kbd>|  create a line with 66 chars ;
<kbd>M-z</kbd>| Zap to chrs
<kbd>C-c a</kbd>| Increment
<kbd>C-c x</kbd>| Decrease one
<kbd>C-x s</kbd>| Save-buffer
<kbd>C-x k</kbd>| Kill-buffer
<kbd>C-x [right]</kbd>| next-buffer
<kbd>C-x C-m</kbd>| Compile with Makefile
<kbd>C-[backspace]</kbd>| backward-kill-word




### Clojure Bindings

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-c C-x j j</kbd>| Launch cider
<kbd>C-x M-j</kbd>| Cider-jackin
<kbd>C-c C-x M-j [Enter]</kbd>| Cider-jack-in-clj&cljs
<kbd>M-></kbd>| cider-jump-to-var
<kbd>M-.</kbd>| cider-find-var
<kbd>C-c C-q</kbd>| cider-quit
<kbd>C-c C-f</kbd>| cider-pprint-eval-defun-at-point
<kbd>C-c C-a</kbd>| cider-eval-print-last-sexp
<kbd>C-c C-v C-r</kbd> | cider-eval-region
<kbd>C-c C-v C-n</kbd> | cider-eval-ns-form
<kbd>C-x C-e</kbd> | cider-eval-last-sexp
<kbd>C-c C-v C-v</kbd> | cider-eval-sexp-at-point
<kbd>C-M-x</kbd> | cider-eval-defun-at-point
<kbd>C-c C-a</kbd> | cider-eval-print-last-sexp
<kbd>C-c C-v C-o</kbd> | cider-eval-sexp-up-to-point
<kbd>C-c M-;</kbd> | cider-eval-defun-to-comment
<kbd>C-c C-v C-z</kbd> | cider-eval-defun-up-to-point
<kbd>C-c M-e</kbd> | cider-eval-last-sexp-to-repl
<kbd>C-c C-v C-c</kbd> | cider-eval-last-sexp-in-context
<kbd>C-c C-v C-w</kbd> | cider-eval-last-sexp-and-replace
<kbd>C-c C-v C-b</kbd> | cider-eval-sexp-at-point-in-context
<kbd>C-c C-x</kbd>| cider-ns-refresh


### Org Mode

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-c RET</kbd> | browse-url


### Global Bindings from my config

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-c C-e</kbd>| eval with lispxmp
<kbd>C-[f4]</kbd>| html-html5-template
<kbd>C-[f7]</kbd>| insert html snippet
<kbd>S-[f8]</kbd>  | open dired-sidebar
<kbd>C-x r b</kbd> | open bookmarks list with helm
<kbd>C-x h TAB</kbd>| indent all lines
<kbd>C-></kbd>| mc/mark-next-like-this
<kbd>C-<</kbd>| mc/skip-to-next-like-this
<kbd>C-*</kbd>| mc/mark-all-like-this
<kbd>C-c C-></kbd>| mc/mark-all-dwim
<kbd>C-[PgUp]</kbd>| next buffer
<kbd>C-[PgDown]</kbd>| prior buffer
<kbd>C-c C-d</kbd>| put-the-date
<kbd>C-x 6</kbd>| iflipb
<kbd>M-up</kbd>| move text line up
<kbd>M-down</kbd>| move text line down
<kbd>C-c C-e</kbd>| eval lisp with lispxmp
<kbd>C-c y</kbd>| Copy and paste line
<kbd>C-c w</kbd>| select-whole-line
<kbd>C-c t</kbd>| shell-pop
<kbd>M-g y</kbd>| paste gitconfig into buffer
<kbd>M-g j</kbd>| paste gitconfig into buffer


### Buffers

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-c M-n</kbd> | Next group filters buffers
<kbd>C-c M-p</kbd> | Previous group filters buffers
<kbd>C-s</kbd> | Helm Buffers list
<kbd>C-c C-n</kbd>| new-empty-buffer
<kbd>C-x 4 n</kbd>| create-scratch-buffer
<kbd>C-x 4 ,</kbd>| new-org-mode-buffer
