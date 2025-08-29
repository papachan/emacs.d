;;; setup-chatgpt.el --- Initialize chatgpt-shell configurations. -*- lexical-binding: t -*-
;;; Commentary:
;;

;;; Code:

(use-package chatgpt-shell
  :ensure t
  :init
  (setq chatgpt-shell-google-key
        (string-trim (shell-command-to-string "op read \"op://Employee/Gemini API key/credential\"")))
  (setq chatgpt-shell-anthropic-key
        (string-trim (shell-command-to-string "op read \"op://Employee/Anthropic API key/credential\"")))
  (setq shell-maker-prompt-before-killing-buffer nil)
  (setq chatgpt-shell-streaming t))

(provide 'setup-chatgpt)
;;; setup-chatgpt.el ends here
