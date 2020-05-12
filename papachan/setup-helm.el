;;; setup-helm.el
;;
(use-package helm
  :ensure t
  :config (progn
	    (require 'helm-config)

	    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
                  helm-ff-skip-boring-files t
                  helm-candidate-number-limit 100)

		  ;; helm-input-idle-delay 0.01
		  ;; helm-quick-update t
		  ;; helm-candidate-number-limit 100
		  ;; helm-M-x-requires-pattern nil
		  ;; helm-split-window-in-side-p t
		  ;; helm-apropos-fuzzy-match t
		  ;; helm-buffers-fuzzy-matching t
		  ;; helm-window-prefer-horizontal-split t
		  ;; helm-window-show-buffers-function 'helm-window-mosaic-fn
		  ;; helm-eshell-fuzzy-match t
		  ;; helm-imenu-fuzzy-match t
		  ;; helm-M-x-fuzzy-match t
		  ;; helm-recentf-fuzzy-match t
		  ;; helm-reuse-last-window-split-state t
		  ;; helm-buffers-end-truncated-string "…"
		  ;; helm-buffer-max-length 22
		  ;; helm-use-frame-when-more-than-two-windows nil

	    ;; (ido-mode -1)
	    (helm-mode t)))

(provide 'setup-helm)
