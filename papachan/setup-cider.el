;;; setup-cider.el
;; clojure setup

;; Clojure IDE and REPL for Emacs
(require 'cider)
(require 'clj-refactor)
(require 'flycheck-clj-kondo)
(require 'helm-cider)
;; autocompletion
(require 'company)

(use-package cider
  :bind (:map cider-repl-mode-map ("C-X sc" . cider-repl-clear-buffer))
  :config
  (progn
    (setq cljr-suppress-middleware-warnings t)))

(provide 'setup-cider)
;;; setup-cider.el ends here
