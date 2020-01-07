;; setup-company.el
(require 'company)

(use-package company
  :ensure t
  :config
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (add-hook 'after-init-hook 'global-company-mode)
  :bind (:map company-mode-map
              ("C-<tab>" . company-complete)
              :map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)))

(provide 'setup-company)
