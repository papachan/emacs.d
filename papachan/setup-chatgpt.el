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
  (setq chatgpt-shell-openai-key "")
  (setq chatgpt-shell-model-version "o1-mini")
  ;; "o1" ;; Uses advanced reasoning
  ;; "o1-preview"
  ;; "o3-mini-high" ;; Great at coding and logic
  ;; "o1-mini"
  ;; "o3-mini"  ;; Fast at advanced reasoning
  ;; "gpt-4.5-preview" ;; Good for writing and exploring ideas
  ;; "chatgpt-4o" ;;
  ;; "chatgpt-4o-search-preview" ;;
  ;; "chatgpt-4o-latest" ;;
  ;; "chatgpt-4o-mini" ;;
  ;; "chatgpt-4o-mini-search-preview" ;;
  ;; "gpt-3.5-turbo" ;; old
  (setq chatgpt-shell-streaming t))

(provide 'setup-chatgpt)
;;; setup-chatgpt.el ends here
