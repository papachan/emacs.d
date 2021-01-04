;;; setup-swiper.el --- Summary
;;; Commentary:
;;; Code:
;;; setup-ivy.el --- Summary
;;; Commentary:
;;; Code:
(use-package ivy
  :bind (("C-c C-r" . ivy-resume)
         ("<f6>" . ivy-resume))
  :init (setq ivy-use-virtual-buffers t
              enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))

(require 'swiper)
(global-set-key "\C-s" 'swiper)
(global-set-key "\C-r" 'swiper)
;; (use-package ivy
;;   :bind (("C-c C-r" . ivy-resume))
;;   :config
;;   (require 'swiper)
;;   (ivy-mode)

;;   (setq ivy-use-virtual-buffers t
;;         enable-recursive-minibuffers t
;;         ivy-height 13
;;         ivy-count-format "%d/%d "
;;         ivy-virtual-abbreviate 'full ; Show the full virtual file paths
;;         ivy-extra-directories nil ; default value: ("../" "./")
;;         ivy-wrap t
;;         ivy-action-wrap t
;;         ivy-use-selectable-prompt t)

;;   ;; modify default search behaviour of ivy
;;   (setq ivy-re-builders-alist
;;         '((t . ivy--regex-plus)))

;;   (bind-keys
;;    :map ivy-occur-grep-mode-map
;;    ("n" . ivy-occur-next-line)
;;    ("p" . ivy-occur-previous-line)
;;    ("b" . backward-char)
;;    ("f" . forward-char)
;;    ("v" . ivy-occur-press) ; default f
;;    ("RET" . ivy-occur-press)))
(provide 'setup-swiper)
;;; setup-swiper.el ends here
