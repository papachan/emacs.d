;;; init-org.el
;;
(require 'org)
(setq org-emphasis-alist (delete '("+" (:strike-through t)) org-emphasis-alist))

;; Turn on Visual-line-mode
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (setq org-enable-table-editor nil)))

;; (setq org-styles
;;       (cons '("+" '(:strike-through t :foreground "gray"))
;;             (delete* "+" org-emphasis-alist :key 'car :test 'equal)))
;; (add-to-list 'org-emphasis-alist
;;              org-styles)


(dolist (org-styles
         '(("*" (:foreground "green"))
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
