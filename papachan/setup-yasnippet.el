;;; setup-yasnippet.el -- Summary
;;; Commentary:

;;; Code:

(use-package yasnippet
  :config
  (require 'yasnippet)
  (yas-global-mode 1)
  (yas-load-directory "~/.emacs.d/snippets"))

(provide 'setup-yasnippet)
;;; setup-yasnippet.el ends here
