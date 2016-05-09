;;; init-org.el
;;
(require 'org)

(add-to-list 'org-emphasis-alist
             '("*" (:foreground "green")))
(add-to-list 'org-emphasis-alist
             '("/" (italic :foreground "yellow")))
(add-to-list 'org-emphasis-alist
             '("_" (underline :foreground "black" :background "CadetBlue2")))
(add-to-list 'org-emphasis-alist
             '("+" (:strike-through t :foreground "red")))
(add-to-list 'org-emphasis-alist
             '("~" org-code verbatim))
(add-to-list 'org-emphasis-alist
             '("=" org-verbatim verbatim))


(add-to-list 'auto-mode-alist '("\\.\\(org\\|txt\\|doc\\)\\'" . org-mode))

(provide 'init-org)
;; init-org.el ends here
