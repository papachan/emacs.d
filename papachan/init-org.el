;;; init-org.el
;;
(require 'org)
;; Remove the markup characters
(setq org-hide-emphasis-markers t)

;; Turn on Visual-line-mode
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)
(add-hook 'org-mode-hook
          (lambda ()
            (setq org-enable-table-editor nil)))

(dolist (org-styles '(("*" (:foreground "green"))
      ("/" (italic :foreground "yellow"))
      ("_" (underline :foreground "black" :background "CadetBlue2"))
      ("+" (:strike-through t :foreground "red"))
      ("~" org-code verbatim)
      ("=" org-verbatim verbatim)))
    (add-to-list 'org-emphasis-alist
             org-styles))


(add-to-list 'auto-mode-alist '("\\.\\(org\\|txt\\|doc\\)\\'" . org-mode))

(provide 'init-org)
;; init-org.el ends here
