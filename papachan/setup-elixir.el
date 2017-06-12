;;; setup-elixir.el

(setq-local my-elixir-packages '(elixir-mode alchemist))

(dolist (package my-elixir-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'alchemist)
(require 'elixir-mode)
(require 'flycheck-elixir)

(defalias 'run-elixir #'elixir-mode-iex)
(defun run-mix-iex ()
  (interactive)
  (unless (comint-check-proc "*MIX-IEX*")
    (set-buffer
     (let ((default-directory (project-root)))
       (apply 'make-comint "MIX-IEX"
              "iex" nil '("-S" "mix")))))
  (pop-to-buffer "*MIX-IEX*"))

(flycheck-define-checker elixir-mix
  "An Elixir syntax checker using the Elixir interpreter.
   See URL `http://elixir-lang.org/'."
  :command ("mix"
            "compile"
            source)
  :error-patterns
  ((error line-start "** (" (zero-or-more not-newline) ") "
          (zero-or-more not-newline) ":" line ": " (message) line-end)
   (warning line-start
            (one-or-more (not (syntax whitespace))) ":"
            line ": "
            (message)
            line-end))
  :modes elixir-mode)

(add-to-list 'flycheck-checkers 'elixir-mix)

(use-package alchemist
  :ensure t
  :init
  (progn
    (setq alchemist-compile-command "/usr/bin/elixirc"
          alchemist-execute-command "/usr/bin/elixir"
          alchemist-iex-program-name "/usr/bin/iex"
          alchemist-mix-test-default-options '()  ;; default
          alchemist-mix-command "/usr/bin/mix"))
  :config
  (setq alchemist-key-command-prefix (kbd "C-c ,")))

(use-package elixir-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.ex$" . elixir-mode))
  (add-to-list 'auto-mode-alist '("\\.exs$" . elixir-mode))
  ;; Mix setup
  (progn
    (add-hook 'elixir-mode-hook '(lambda()
                                   'alchemist-mode
                                   'flycheck-mode)))
  :config
  ;; Test mode
  (setq alchemist-test-display-compilation-output t))

(provide 'setup-elixir)
;;; setup-elixir.el ends here
