;;; Appearance --- load emacs theme here.  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(load-file (expand-file-name "themes/zerodark-theme/zerodark-theme.el" user-emacs-directory))
(load-theme 'zerodark t)

;; smart-mode-line
;; (setq sml/theme 'respectful)
;; (sml/setup)

(provide 'appearance)
;;; appearance.el ends here
