;;; setup-chatgpt.el --- Initialize chatgpt-shell configurations. -*- lexical-binding: t -*-
;;; Commentary:
;;

;;; Code:

(use-package chatgpt-shell
  :ensure t
  :init
  (setq shell-maker-prompt-before-killing-buffer nil)
  ;; (setq chatgpt-shell-google-key "")
  ;; (setq chatgpt-shell-anthropic-key "")
  ;; (setq chatgpt-shell-deepseek-key "")
  ;; (setq chatgpt-shell-openrouter-key "")
  ;; (setq chatgpt-shell-perplexity-key "")
  ;; (setq chatgpt-shell-kagi-key "")
  (setq chatgpt-shell-model-version "o1-mini")
  ;; "o1"
  ;; "o1-preview"
  ;; "o1-mini"
  ;; "gpt-4.5-preview"
  ;; "gpt-4o"
  ;; "gpt-3.5-turbo"
  (setq chatgpt-shell-streaming t))

(provide 'setup-chatgpt)
;;; setup-chatgpt.el ends here
