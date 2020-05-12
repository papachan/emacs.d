;;; setup-helm.el
;;
(use-package helm
  :ensure t
  :config (progn
	    (require 'helm-config)
	    (setq helm-idle-delay 0.0
                  helm-ff-skip-boring-files t
                  helm-candidate-number-limit 100)
	    (helm-mode t)))

(provide 'setup-helm)
