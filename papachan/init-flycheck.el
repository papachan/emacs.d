;;; init-flycheck.el --- On-the-fly syntax checking

;;; Commentary:
;;

;;; Code:

(use-package flycheck
  :ensure t
  :hook
  (lisp-interaction-mode . flycheck-mode)
  (emacs-lisp-mode       . flycheck-mode)
  (markdown-mode         . flycheck-mode)
  (clojure-mode          . flycheck-mode)
  (clojurescript-mode    . flycheck-mode))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
