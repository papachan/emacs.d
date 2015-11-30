;; clojure setup

;; Clojure IDE and REPL for Emacs
(require 'cider)
;; autocompletion
(require 'company)

(use-package cider
  :config
  (defun tdd-test ()
    "Thin wrapper around `cider-test-run-tests'."
    (when (cider-connected-p)
      (cider-test-run-tests nil)))

  (define-minor-mode tdd-mode
    "Run all tests whenever a file is saved."
    nil " TDD" nil
    (if tdd-mode
        (add-hook 'after-save-hook #'tdd-test nil 'local)
      (remove-hook 'after-save-hook #'tdd-test 'local)))
  (progn
    ;; REPL history file
    (setq cider-repl-history-file
          (expand-file-name "cider-history" dotemacs-dir))
    ;; nice pretty printing
    (setq cider-repl-use-pretty-printing t)
    ;; nicer font lock in REPL
    (setq cider-repl-use-clojure-font-lock t)
    ;; result prefix for the REPL
    (setq cider-repl-result-prefix ";; => ")
    ;; never ending REPL history
    (setq cider-repl-wrap-history t)
    ;; looong history
    (setq cider-repl-history-size 3000)
    ;; eldoc for clojure
    (add-hook 'cider-mode-hook #'eldoc-mode)
    ;; error buffer not popping up
    (setq cider-show-error-buffer nil)
    ; add hook for tdd with cider
	(add-hook 'cider-mode-hook #'tdd-mode)
	(add-hook 'cider-repl-mode-hook #'tdd-mode)
    ; never start completions automatically
    (setq company-idle-delay nil)
    ;; company mode for completion
    ;(add-hook 'cider-repl-mode-hook #'company-mode)
    ;(add-hook 'cider-mode-hook #'company-mode)
    (global-set-key (kbd "M-TAB") #'company-complete) ; meta+tab, aka C-M-i, as manual trigger
    (custom-set-faces
        '(cider-test-success-face ((t (:foreground "green" :background nil)))))
    ;; paredit-mode
    (add-hook 'clojure-mode-hook 'paredit-mode)))

;;; setup-cider.el ends here
