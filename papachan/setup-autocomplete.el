;;; setup-autocomplete.el
(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(setq ac-ignore-case nil)
(global-auto-complete-mode t)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(provide 'setup-autocomplete)
;;; setup-autocomplete.el ends here
