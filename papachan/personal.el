(cond
 ((eq system-type 'gnu/linux)
  (progn
    ((lambda (font)
       (set-frame-font font)
       (set-face-attribute 'default nil
                           :font font
                           :height 120
                           :weight 'normal)
       (set-face-font 'default font))
     "Ubuntu Mono")))
 ((eq system-type 'darwin)
  (progn
    ((lambda (font)
       (set-frame-font font)
       (set-face-attribute 'default nil
                           :font font
                           :height 150
                           :weight 'normal)
       (set-face-font 'default font))
     "Fira Code")
    (let ((alist '((33 . ".\\(?:\\(?:==\\)\\|[!=]\\)")
                   (35 . ".\\(?:[(?[_{]\\)")
                   (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                   (42 . ".\\(?:\\(?:\\*\\*\\)\\|[*/]\\)")
                   (43 . ".\\(?:\\(?:\\+\\+\\)\\|\\+\\)")
                   (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                   (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=]\\)")
                   (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                   (58 . ".\\(?:[:=]\\)")
                   (59 . ".\\(?:;\\)")
                   (60 . ".\\(?:\\(?:!--\\)\\|\\(?:\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[/<=>|-]\\)")
                   (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                   (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                   (63 . ".\\(?:[:=?]\\)")
                   (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                   (94 . ".\\(?:=\\)")
                   (123 . ".\\(?:-\\)")
                   (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                   (126 . ".\\(?:[=@~-]\\)"))))
      (dolist (char-regexp alist)
        (set-char-table-range composition-function-table (car char-regexp)
                              `([,(cdr char-regexp) 0 font-shape-gstring])))))))

