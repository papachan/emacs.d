;;; setup-elixir.el

(setq-local my-elixir-packages '(elixir-mode alchemist))

(dolist (package my-elixir-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'alchemist)
(require 'elixir-mode)

;; Mix setup
(setq alchemist-mix-command "~/bin/mix")
(setq alchemist-iex-program-name "~/bin/iex")
(setq alchemist-execute-command "~/bin/elixir")
(setq alchemist-compile-command "~/bin/elixirc")

;; Test mode
(setq alchemist-test-display-compilation-output t)

(provide 'setup-elixir)
;;; setup-elixir.el ends here
