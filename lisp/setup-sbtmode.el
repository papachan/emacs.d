;;; setup-sbtmode.el

(require 'sbt-mode)
(require 'scala-mode2)

(prelude-require-package 'sbt-mode)

;; ENSIME
;; Quick Start Guide: https://github.com/ensime/ensime-server/wiki/Quick-Start-Guide
(setenv "PATH" (concat "/usr/local/bin/sbt:" (getenv "PATH")))
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; sbt-mode is not auto-loaded by default.
;; https://github.com/hvesalai/sbt-mode
(add-to-list 'auto-mode-alist '("\\.sbt\\'" . sbt-mode))

(provide 'setup-sbtmode)
;;; setup-sbtmode.el ends here
