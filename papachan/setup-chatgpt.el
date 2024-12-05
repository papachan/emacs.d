;;; setup-chatgpt.el --- Initialize chatgpt-shell configurations
;;; Commentary:
;;

;;; Code:

(use-package chatgpt-shell
  :ensure t
  :init
  (setq shell-maker-prompt-before-killing-buffer nil)
  (setq chatgpt-shell-openai-key
      (auth-source-pick-first-password :host "api.openai.com"))
  ;; (setq chatgpt-shell-google-key "my-key")
  ;; (setq chatgpt-shell-anthropic-key "my-key")
  ;; (setq chatgpt-shell-perplexity-key "my-key")
  ;; (setq chatgpt-shell-kagi-key "my-key")
  (setq chatgpt-shell-chatgpt-model-version "o1-mini")
  ;; chatgpt-4o-latest
  ;; o1-preview
  ;; o1-mini
  ;; gpt-4o
  ;; claude-3-5-sonnet-20240620
  ;; gemini-1.5-pro-latest
  ;; gemini-1.5-flash
  ;; llama3.2
  ;; llama3.2:1b
  ;; gemma2:2b
  )

(provide 'setup-chatgpt)
;;; setup-chatgpt.el ends here
