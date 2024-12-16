;;; setup-yasnippet.el -- Summary
;;; Commentary:

;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (require 'yasnippet)
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-reload-all))

(provide 'setup-yasnippet)
;;; setup-yasnippet.el ends here
