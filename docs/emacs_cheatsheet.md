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
<kbd>C-c [enter]</kbd>| open-url


### Helm Bindings
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-x c M-g a</kbd> | helm-do-grep-ag



### Clojure Bindings

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-x h tab</kbd>| indent code
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
<kbd>C-c C-p</kbd> | cider-eval-last-sexp in popup
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
<kbd>C-c C-t t</kbd> | cider-test-run-test
<kbd>C-c C-t a</kbd> | cider-test-rerun-test
<kbd>C-c M-r</kbd> | cider-restart
<kbd>C-c M-n r</kbd> | cider-ns-refresh
<kbd>C-u C-c M-n r</kbd> | cider-ns-reload-all
<kbd>C-c C-z</kbd> | cider-switch-to-repl-buffer
<kbd>C-u C-c C-z</kbd> | cider-switch-to-repl-buffer with prefix



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
<kbd>M-s</kbd>| rg (search in files with ripgrep)


### Buffers

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-M-m</kbd> | Next group filters buffers
<kbd>C-M-p</kbd> | Previous group filters buffers
<kbd>C-s</kbd> | Helm Buffers list
<kbd>C-c C-n</kbd>| new-empty-buffer
<kbd>C-x 4 n</kbd>| create-scratch-buffer
<kbd>C-x 4 ,</kbd>| new-org-mode-buffer




C-c C-x j j              launch cider
C-u C-c M-j              launch cider with prefix you can add: "-A:dev"
C-c C-x j s              cider-jack-in-cljs
C-c C-x s s              cider-connect-sibling-cljs
,                        to quickly invoke some REPL command
C-c C-z                  to switch between the REPL and a Clojure file
M-.                      to jump to the source of something (e.g. a var, a Java method)
C-c C-d C-d              cider-doc to view the documentation for something (e.g. a var, a Java method
C-c M-t v
C-c M-t n                toggling tracing on/off
C-u C-M-x                set a debug point
C-c C-c                  remove debug point
C-c M-c                  cider-connect
C-c C-z                  display cider repl buffer in current window
C-c C-k                  compile and load current buffer 'cider-load-buffer
C-c C-f                  load file
C-c c-l
C-x C-e                  cider-eval-sexp-at-point
C-j                      open a new line and indent
C-c C-e                  eval in minibuffer
C-c M-e                  eval in minibuffer and send it to repl
C-c C-d C-w              cider-clojuredocs-web
C-c M-n n                'cider-repl-set-ns
q                        close *cider-error*
C-c C-d d                show the documentaion
C-c C-d C-c              look up symbol in clojuredoc
C-c M-n                  switch to namespace of current Clojure buffer
M->                      M-x cider-jump-to-var
M-.                      M-x cider-find-var
C-c C-q                  M-x cider-quit
C-c M-z                  'cider-load-buffer-and-switch-to-repl-buffer
C-c M-n r                'cider-refresh
C-x s c                  cider-repl-clear-buffer
C-u C-c C-o              clear all output
C-c C-o                  Remove the output of the previous evaluation from the
                         REPL buffer.
C-c C-c                  cider-eval-defun-at-point (which cancels whatever is being evaluated)
C-c C-u                  cider-repl-kill-input
C-c C-b                  cider-interrupt
C-c C-c                  at repl buffer will break from a loop at the top level of the cider repl
                         equivalent to C-c in a term
C-c M-o                  Switch to other repl session
C-c C-t                  run tests
C-c ,                    run tests
C-c C-t l                load tests
C-c C-t p                load all test projects
C-c C-t a                cider-test-rerun-test
C-c C-t n                reload buffer and run tests
C-c C-t C-n
C-c C-t C-p              'cider-test-run-project-tests
C-c C-m                  clj-refactor
C-c ml           move to let
C-c rs           rename local symbol
C-c is           inline symbol
C-c ps           promote function
C-c ef           extract function
C-c RET a s      cljr-add-stubs
C-c RET a u      cljr-add-use-to-ns
C-c RET a d      cljr-add-declaration
C-c RET a i      cljr-add-import-to-ns
C-c RET a r      cljr-add-require-to-ns
C-c RET a m      cljr-add-missing-libspec
C-c RET a p      cljr-add-project-dependency
C-c M-n r        'cider-ns-refresh
C-c M-n M-r
C-u C-c M-n r    Adding a prefix argument will reload all the
                 namespaces on the classpath unconditionally, regardless of their
                 modification status.
C-u C-u M-n r    will first clear the state of the namespace tracker
                 before reloading. This is useful for recovering from
                 some classes of error that normal reloads would
                 otherwise not recover from.
C-c M-m         cider-macroexpansion
C-c C-d C-a     'cider-apropos
cider-xref-fn-refs (C-c C-? r)
cider-xref-fn-refs-select (C-c C-? C-r).
cider-xref-fn-deps (C-c C-? d)
cider-xref-fn-deps-select (C-c C-? C-d)




C-c C-d         put-the-date
C-c C-j         replace-string
C-c C-l         toggle-truncate-lines
C-c RET         browse-url
C-c C-n         new-empty-buffer
C-c C-o         delete-trailing-whitespace
C-c C-q         slime-repl-quit
C-c C-r         ivy-resume
C-c C-v         other-frame
C-c -           buffer/clear
C-c <           my-unindent-region
C-c >           my-indent-region
C-c a           my-increment-number-at-point
C-c d           kill-whole-line
C-c f           follow-mode
C-c g           vr/mc-mark
C-c h           file-path-on-clipboard
C-c i           snippet-latin
C-c m           magit-status
C-c o           insert-a-blank-line
C-c q           vr/query-replace
C-c r           vr/replace
C-c s           slime-selector
C-c v           revert-buffer-without-confirmation
C-c w           select-whole-line
C-c x           my-decrement-number-at-point
C-c y           Keyboard Macro
C-c C->         mc/mark-all-dwim
C-c <backspace>                 join-line*
C-c <deletechar>                fixup-whitespace


<kbd>M-esc esc</kbd>|       keyboard-escape-quit
<kbd>C-x z</kbd>|     Magic. repeat last operation
<kbd>M-!</kbd>| shell command
<kbd>ESC !</kbd>|  shell-command
<kbd>ESC x compile</kbd>|   compile ("make -k" is default)
<kbd>C-x `</kbd>|  next-error(used after "compile" to find/edit errors)
<kbd>C-u</kbd>|    universal-argument
<kbd>C-x C-z</kbd>|suspend-emacs(resume by typing "fg" to unix)
<kbd>C-h</kbd>|    help-command
<kbd>C-h t</kbd>|  help-with-tutorial
<kbd>C-h b</kbd>|  describe-bindings(complete list of emacs commands)

<kbd>C-c C-k</kbd>|  compile code
<kbd>C-c ,</kbd>|    run test
<kbd>C-c M-j</kbd>| connected to repl
<kbd>C-x * c</kbd>|    start calculator
<kbd>C-h m</kbd>|   Show describe mode
<kbd>C-x C--</kbd>|  transform frame
<kbd>C-x C-+</kbd>|   transform frame
<kbd>C-x {</kbd>|  make window taller
<kbd>C-x }</kbd>| enlarge-window-horizontally make window wider
<kbd>C-u 4 0 C-x 3</kbd>| open a window with a fixed width
<kbd>C-c C-e</kbd>|export - only in org-mode
<kbd>C-x C-s</kbd>|save the current file without confirmation
<kbd>C-x C-w</kbd>|write your file (save as)
<kbd>C-x C-f</kbd>|	Open (Find) a file
<kbd>C-x C-w</kbd>|	Save As
<kbd>C-x s</kbd>|	Save any unsaved files
<kbd>C-x C-c</kbd>|exit the emacs (but save files first)
<kbd>C-a</kbd>|        go to the beginning-of-line
<kbd>C-e</kbd>|        go to: end-of-the-line
<kbd>M-a</kbd>|        navigate between blocks
<kbd>M-e</kbd>|        go to the block end
<kbd>Shift M-e</kbd>|Select whole paragraph
<kbd>C-n</kbd>|        go to next-line
<kbd>C-p</kbd>|        go to previous-line
<kbd>C-x l</kbd>| line count of current file
<kbd>C-k</kbd>|        positionate at the begin of line & kill the current line
<kbd>C-Shift-backspace</kbd>|   kill whole line
<kbd>M-k</kbd>|                 kill whole block text
<kbd>C-t</kbd>|  switch with previous char
<kbd>C-c o</kbd>|      Insert a new line above
<kbd>C-o</kbd>|        Insert a new line (open-line)
<kbd>C-q C-j</kbd>|    insert end of line
<kbd>C-x C-g</kbd>|go to a specific line numbered x
<kbd>C-x C-w</kbd>|show (in the minibuffer ) the current line number
<kbd>ESC d</kbd>|  kill-word
<kbd>ESC f</kbd>|  forward-word
<kbd>ESC b</kbd>|  backward-word
<kbd>ESC DEL</kbd>|backward-kill-word
<kbd>C-f</kbd>|    forward-char
<kbd>C-b</kbd>|    backward-char
<kbd>C-d</kbd>|    delete-char
<kbd>DEL</kbd>|    delete-backward-char
<kbd>C-q</kbd>|    quoted-insert
<kbd>C-t</kbd>|    transpose-chars
<kbd>C-x C-o</kbd>|delete next line
<kbd>C-space</kbd>|set a region mark
<kbd>C-w</kbd>|    kill-region (between cursor and mark)
<kbd>ESC-w</kbd>|  memorize the contents of the region (without kill)
<kbd>C-y</kbd>|    yank (i.e., insert text last killed or memorize)
<kbd>C-l</kbd>|    recenter
<kbd>C-v</kbd>|    scroll-up (forward)
<kbd>ESC-v</kbd>|  scroll-down (backward)
<kbd>ESC <</kbd>|  beginning-of-buffer
<kbd>ESC ></kbd>|  end-of-buffer
<kbd>C-x C-f</kbd>|find-file
<kbd>C-x C-r</kbd>|find-file-read-only
<kbd>C-x C-s</kbd>|save-current-file
<kbd>C-c p s g</kbd>|       Projectile Run grep on the files in the project.
<kbd>C-x 1</kbd>|  delete-other-windows
<kbd>C-x 2</kbd>|  split-window-vertically
<kbd>C-x 4 f</kbd>|find-file-other-window
<kbd>C-x o</kbd>|  other-window
<kbd>C-x 3</kbd>|  split window
<kbd>C-x o</kbd>|  change window focus
<kbd>C-x C-f</kbd>| open a file
<kbd>M-1</kbd>|    change to window number
<kbd>C-c C-e</kbd>| Export pdf after: `l p`
<kbd>C-x m</kbd>|  Compose a new email
<kbd>C-s</kbd>|    search
<kbd>C-r</kbd>|    reverse search
<kbd>C-x e</kbd>|  eshell emacs shell (find-file)
<kbd>C-S backspace</kbd>|   delete a line
<kbd>C-c w   C-x rd</kbd>|  delete a marked region
<kbd>C-x u</kbd>|  Undo-tree
<kbd>C-_ C-/</kbd>|undo-tree-undo Undo changes.
<kbd>M-_ C-?</kbd>|undo-tree-redo Redo changes.
<kbd>M-f</kbd>|		move word forward
<kbd>M-b</kbd>|    move previous word
<kbd>C-a</kbd>|    move to the beginning of the line
<kbd>C-e</kbd>|    move to end of the line
<kbd>M-a</kbd>|    move to the beginning of sentence
<kbd>M-e</kbd>|    move forward to the end of sentence
<kbd>M-0 M-r</kbd>|Top of window (disabled by window-numbering)
<kbd>M-- M-r</kbd>|Bottom of window
<kbd>M-></kbd>|    Top of buffer
<kbd>M-<</kbd>|    Bottom of buffer
<kbd>M-c</kbd>|    Capitalize word
<kbd>M-u</kbd>|  Uppercase
<kbd>M-l</kbd>| Lowercase
<kbd>C-x C-l</kbd>|lower case a region
<kbd>C-x C-u</kbd>|uppercase a region
<kbd>C-x C-b</kbd>|ibuffer
<kbd>C-x b</kbd>|  switching buffer (you can write a new buffer)
<kbd>C-x C-b</kbd>|Quick buffer list
<kbd>C-x 0</kbd>|  Delete the current window
<kbd>C-x 1</kbd>|  close other window
<kbd>C-x 2</kbd>|  split buffer into two windows horizontally
<kbd>C-x 3 </kbd>| split-window-right split buffer into two windows vertically
<kbd>C-x 4 f</kbd>|find a file in other window
<kbd>C-x 4 b</kbd>|switch buffer in other window
<kbd>C-x 5 2</kbd>|make-frame-command
<kbd>C-u 40 = </kbd>|       insert a line of 40 =
<kbd>C-q 361</kbd>|ñ
<kbd>C-c C-c</kbd>|magit commit
<kbd>C-SPC</kbd>|  just C-SPC and mark the region you want to commit and s or SHIFT+ arrows and s
<kbd>C-x d</kbd>|  open dired and path directory
<kbd>C-x C-j</kbd>|        navigate all dired buffers
<kbd>C-x C-d</kbd>|        just list a directory
<kbd>C-x 4 d</kbd>|        open a new dired frame
<kbd>C-x C-q</kbd>|        M-x dired-toggle-read-only after C-c C-c to exit
<kbd>C-space</kbd>|        select region
<kbd>C-c w</kbd>| select whole line (if shortcuts exists)
<kbd>C-w</kbd>|   cut
<kbd>M-w</kbd>|   copy
<kbd>C-y</kbd>|   paste
<kbd>C-x rd</kbd>|delete inside rectangle

<kbd>C-x rt</kbd>|edit a column on a multiple lines

<kbd>C-x h</kbd>| select all buffer
<kbd>C-Space   C-x rt </kbd>|(write something) `Enter`
<kbd>M-<tab></kbd>|        Dictionary
<kbd>C-x l</kbd>| show all the lines
<kbd>M-q</kbd>|   Justify text
<kbd>C-q C-j</kbd>|        insert a new line above
<kbd>C-x  [arrow < >]</kbd>| buffer/window navigation
<kbd>C-x C-e</kbd>| eval last expression
<kbd>C-j</kbd>|     eval print last expression
<kbd>C-h v</kbd>|   eval current variable
<kbd>M-:</kbd>|     eval-expression (if nil "yes" "no") eval an expression in minibuffer
<kbd>C-M-x</kbd>|   (lisp-eval-defun)
<kbd>C-c C-l</kbd>| run a file
<kbd>C-x C-f</kbd>| find a file
<kbd>C-h f</kbd>|   function describe
<kbd>C-c M-j</kbd>| launch cider-jack-in
<kbd>C-c M-c</kbd>| cider-connect
<kbd>C-x b</kbd>|   *cider-repl*
<kbd>C-c C-e</kbd>| eval in minibuffer
<kbd>C-c M-e</kbd>| eval and the result is sent to the REPL
<kbd>C-x C-e</kbd>| eval current buffer
<kbd>C-c C-k</kbd>| compile current file/buffer
<kbd>C-c M-n</kbd>| Switch to namespace of the current buffer
<kbd>q</kbd>|       close *cider-error*
<kbd>C-c C-d d</kbd>|        show the documentaion
<kbd>C-c M-n</kbd>| switch to namespace of current Clojure buffer
<kbd>M-(</kbd>|     paredit: put parens ()
<kbd>C- right arrow</kbd>|   paredit: Slurp; forward-slurp-sexp move closing parenthesis to the right to include next expression
<kbd>C- left arrow</kbd>|    paredit: Barf; forward-barf-sexp move closing parenthesis to the left to exclude last expression
<kbd>M-r</kbd>|     paredit: raise-sexp
<kbd>M- up arrow</kbd>|      splice-sexp-killing-backward
<kbd>C-M-f C-M-b</kbd>|     Move opening / closing parenthesis
<kbd>M-?</kbd>|     convolute-sexp
<kbd>M-s</kbd>|     paredit-kill-sexp
<kbd>C-k</kbd>|     kill expression
<kbd>M-q</kbd>|    Wrap into 80 chars per columns
<kbd>M-Shift-:</kbd>|       eval
<kbd>C-c C-v</kbd>|open file in a browser
<kbd> \<f2> \<f2></kbd>|       two columns screens
<kbd>C-n</kbd>|    open a new buffer (alias 'new-empty-buffer)
<kbd>C-x C-e</kbd>|eval expression
<kbd>C-c C-d C-d</kbd>|     documentation symbol under the cursor
<kbd>C-c RET</kbd>|show the expansion of the macro frame
<kbd>C-v</kbd>|    cls repl
<kbd>C-c C-v TAB</kbd>|     slime inspector inside object
<kbd>C-c C-c</kbd>|On a defun show compile errors
<kbd>C-c M-o</kbd>|clear the repl buffer 'slime-repl-clear-buffer
<kbd>C-c C-d C-d</kbd>|     show documentation of the symbol under the cursor
<kbd>C-x b</kbd>|      switch with buffer
<kbd>C-x C-r</kbd>|    back to last edited file
<kbd>M-;</kbd>|        Comment a region
<kbd>C-q C-j</kbd>| a string to replace (you can put a newline C-q C-j)
<kbd>C-c C-j</kbd>|     replace-string
<kbd>C-x r m</kbd>|     flag a bookmark
<kbd>C-x r l</kbd>|     list
<kbd>C-x r b</kbd>|     jump
<kbd>C-h w</kbd>|       shortcuts help
<kbd>C-h b</kbd>|       describe-bindings
<kbd>C-x n n</kbd>|     fancy narrow region
<kbd>C-x n w</kbd>|     fancy narrow widen
<kbd>C-c p f</kbd>|     find a file in project with helm
<kbd>C-c c</kbd>|       select a dir for neotree-mode
<kbd>C-c psg</kbd>|     projectile grep find in project
<kbd>C-s C-y</kbd>|     select all match from a copied text (C-w)
<kbd>C-s C-w</kbd>|     search for next word
<kbd>C-x 8</kbd>|  insert an accent over deadkey
<kbd>C-u 66 ;</kbd>|  create a line of ; with 66 chars C-u 66 #
<kbd>C-c y</kbd>|  'djcb-duplicate-line
