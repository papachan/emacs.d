;;; setup-yasnippet.el
;;;
(require 'yasnippet)

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-global-mode 1))


(provide 'setup-yasnippet)
;;; setup-yasnippet.el ends here
