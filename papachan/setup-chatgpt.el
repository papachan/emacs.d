;;; setup-chatgpt.el --- Initialize chatgpt-shell configurations
;;; Commentary:
;;

;;; Code:

(use-package chatgpt-shell
  :ensure t
  :init
  (setq shell-maker-prompt-before-killing-buffer nil)
  ;; (setq chatgpt-shell-google-key "")
  ;; (setq chatgpt-shell-anthropic-key "")
  ;; (setq chatgpt-shell-openai-key "")
  (setq chatgpt-shell-model-version "o1-mini")
  (setq chatgpt-shell-streaming t))

(provide 'setup-chatgpt)
;;; setup-chatgpt.el ends here
