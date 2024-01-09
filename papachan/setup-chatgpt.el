;;; setup-chatgpt.el --- Initialize chatgpt-shell configurations
;;; Commentary:
;;

;;; Code:

(use-package chatgpt-shell
  :ensure t
  :init
  (setq chatgpt-shell-model-version 6)
  (setq chatgpt-shell-chatgpt-streaming t)
  (setq chatgpt-shell-openai-key ""))

(provide 'setup-chatgpt)
;;; setup-chatgpt.el ends here
