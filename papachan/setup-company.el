;;; setup-company.el --- Summary
;;; Commentary:
;;; Code:
(require 'company)

(use-package company
  :ensure t
  :pin "melpa"
  :init
  (global-company-mode t)
  ;; (global-set-key (kbd "M-/") 'company-complete)
  :config
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  :custom
  (company-minimum-prefix-length 3)
  (company-idle-delay 0.1)
  (company-show-quick-access "off")
  ;; (company-quick-access-hint-function (lambda (param) " unknown"))
  :bind (:map company-mode-map
              ("C-<tab>" . company-complete)
              :map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("M-<". company-select-first)
	      ("M->". company-select-last)))

(provide 'setup-company)
;;; setup-company.el ends here
