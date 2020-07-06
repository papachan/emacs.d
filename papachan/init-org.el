;;; init-org.el
;;
(require 'org)
(require 'ob-clojure)
(require 'cider)

(setq org-emphasis-alist (delete '("+" (:strike-through t)) org-emphasis-alist))

;; Turn on Visual-line-mode
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)

(dolist (org-styles
         '(("*" (:foreground "green"))
           ("/" (italic :foreground "yellow"))
           ("_" (underline :foreground "black" :background "CadetBlue2"))
           ;; ("+" (:strike-through t :foreground "gray"))
           ("~" org-code verbatim)
           ("=" org-verbatim verbatim)))
    (add-to-list 'org-emphasis-alist
             org-styles))

(add-to-list 'auto-mode-alist '("\\.\\(org\\|doc\\)\\'" . org-mode))

(setq org-babel-clojure-backend 'cider)

(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
  'org-babel-load-languages
  '((lisp . t)
    (emacs-lisp . t)
    (python . t)
    (calc . t)
    (clojure . t)
    (shell . t)))

(provide 'init-org)
;; init-org.el ends here
