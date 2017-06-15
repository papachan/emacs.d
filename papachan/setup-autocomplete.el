;;; setup-autocomplete.el

;; autocomplete
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.5.1")

(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories
             (concat user-emacs-directory "vendor/auto-complete-1.5.1/dict"))
(ac-config-default)
(setq ac-ignore-case nil)
(global-auto-complete-mode t)

(provide 'setup-autocomplete)
;;; setup-autocomplete.el ends here
