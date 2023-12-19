;;; setup-chatgpt.el --- Initialize chatgpt-shell configurations
;;; Commentary:
;;

;;; Code:

(use-package chatgpt-shell
  :ensure t
  :init
  (setq chatgpt-shell-chatgpt-model-version "gpt-3.5-turbo-0613")
  (setq chatgpt-shell-chatgpt-streaming t)
  :custom
  ((chatgpt-shell-openai-key
    (lambda ()
      (auth-source-pass-get 'secret "")))))

(provide 'setup-chatgpt)
;;; setup-chatgpt.el ends here
