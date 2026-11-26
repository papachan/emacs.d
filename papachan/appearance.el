;;; Appearance --- load emacs theme here. -*- lexical-binding: nil; -*-
;;; Commentary:

;;; Code:
(setq inhibit-compacting-font-caches t)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package zerodark-theme
  :config
  (load-theme 'zerodark t)
  (zerodark-setup-modeline-format))

(progn
  ((lambda (font)
     (set-frame-font font)
     (set-face-attribute 'default nil
                         :font font
                         :height 102
                         :weight 'normal)
     (set-face-font 'default font))
   "JetBrains Mono"))

;; (setq sml/theme 'respectful)
;; (sml/setup)

(provide 'appearance)
;;; appearance.el ends here