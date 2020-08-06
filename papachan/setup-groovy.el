;;; setup-groovy.el --- Groovy
;;; Commentary:
;;; Code:
(require 'groovy-electric)

(use-package groovy-mode
  :defer t
  :mode "\\.groovy?\\'"
  :config
  (add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
  (add-hook 'groovy-mode-hook
            '(lambda ()
               (setq c-basic-offset 4)
               (c-set-offset 'label 4)
               ;; (require 'groovy-electric)
               (groovy-electric-mode)
               ;; disable fancy groovy indent
               (setq indent-line-function 'indent-relative))))

(provide 'setup-groovy)
;;; setup-groovy.el ends here
