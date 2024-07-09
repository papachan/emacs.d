;;; setup-eros.el --- Summary
;;; Commentary:
;;

;;; Code:

;; from https://github.com/xenodium/dotsies/blob/main/emacs/features/fe-elisp.el
(require 'edebug)
(require 'prog-mode)

(use-package eros
  :ensure t
  :commands eros-eval-defun
  :hook (emacs-lisp-mode . eros-mode)
  :config
  (defun adviced:edebug-compute-previous-result (_ &rest r)
    "Adviced `edebug-compute-previous-result'."
    (let ((previous-value (nth 0 r)))
      (if edebug-unwrap-results
          (setq previous-value
                (edebug-unwrap* previous-value)))
      (setq edebug-previous-result
            (with-temp-message ""
              (edebug-safe-prin1-to-string previous-value)
              (message "%s" (prin1-to-string previous-value))))))

  (advice-add #'edebug-compute-previous-result
              :around
              #'adviced:edebug-compute-previous-result)

  (defun adviced:edebug-previous-result (_ &rest r)
    "Adviced `edebug-previous-result'."
    (eros--make-result-overlay edebug-previous-result
      :where (point)
      :duration eros-eval-result-duration))

  (advice-add #'edebug-previous-result
              :around
              #'adviced:edebug-previous-result))

(provide 'setup-eros)
;;; setup-eros.el ends here
