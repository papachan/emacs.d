;;; setup-hiccup.el
;;
(require 'html-to-hiccup)

(use-package html-to-hiccup
  :ensure t
  :config
  (define-key clojure-mode-map (kbd "C-c h h") 'html-to-hiccup-convert-region))

(provide 'setup-hiccup)
;;; setup-hiccup.el ends here
