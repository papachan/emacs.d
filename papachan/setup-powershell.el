;;; setup-powershell.el --- Summary. -*- lexical-binding: nil; -*-
;;; Commentary:

;;; Code:

(use-package powershell
  :ensure t
  ;; `:commands' keeps this deferred: `powershell' is already autoloaded by
  ;; package.el, so naming it here just stops use-package from `require'-ing
  ;; the package body eagerly at startup.  `:config' then only runs -- and
  ;; only registers the advice -- once the library actually loads, i.e. the
  ;; first time a shell is created.
  :commands (powershell)
  :config
  (advice-add 'powershell--get-max-window-width :override #'ignore)
  (advice-add 'powershell--define-set-window-width-function :override #'ignore)
  (advice-add 'powershell--set-window-width :override #'ignore))

(provide 'setup-powershell)
;;; setup-powershell.el ends here
