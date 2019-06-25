;;; init-org.el
;;
(require 'org)
(require 'ob-python)
(setq org-emphasis-alist (delete '("+" (:strike-through t)) org-emphasis-alist))

;; Turn on Visual-line-mode
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)

(org-babel-do-load-languages
  'org-babel-load-languages
    '((python . t)
      ;; (matlab . t)
      ))

(dolist (org-styles
         '(("*" (:foreground "red"))
           ("/" (italic :foreground "yellow"))
           ("_" (underline :foreground "black" :background "CadetBlue2"))
           ;; ("+" (:strike-through t :foreground "gray"))
           ("~" org-code verbatim)
           ("=" org-verbatim verbatim)))
    (add-to-list 'org-emphasis-alist
             org-styles))

(add-to-list 'auto-mode-alist '("\\.\\(org\\|txt\\|doc\\)\\'" . org-mode))

(provide 'init-org)
;; init-org.el ends here
