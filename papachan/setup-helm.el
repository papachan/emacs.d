;;; setup-helm.el
;;
(require 'helm-posframe)
(use-package helm
  :ensure t
  :config (progn
	    (require 'helm-config)
	    (setq helm-idle-delay 0.0
                  helm-ff-skip-boring-files t
                  ;; helm-window-prefer-horizontal-split t
                  helm-candidate-number-limit 100)
	    (helm-mode t)
            (helm-posframe-enable)
            (setq helm-posframe-parameters
                  '((left-fringe . 10)
                    (right-fringe . 10)))))

(provide 'setup-helm)
