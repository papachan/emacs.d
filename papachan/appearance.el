;;; Appearance --- load emacs theme here
;;; Commentary:
;;; Code:

(use-package all-the-icons
  :if (display-graphic-p))

(use-package dired-rainbow
  :after dired
  :config
  (dired-rainbow-define lang1 "#87b524" ("clj" "cljs" "cljc" "el"))
  (dired-rainbow-define zipped "#e92c13" ("gz" "zip"))
  (dired-rainbow-define lang2 "#b48ead" ("lua" "css" "sass" "scss" "html" "json"))
  (dired-rainbow-define text "#88c0d0" ("org" "md" "toml" "yml" "yaml" "txt"))
  (dired-rainbow-define document "#88c0d0" ("odt" "pdf" "epub" "odp"))
  (dired-rainbow-define media "#d08770" ("webm" "webp" "jpg" "jpeg" "png" "svg"))
  (dired-rainbow-define-chmod executable-unix "#bf616a" "-.*x.*"))

(load-file (expand-file-name "themes/zerodark-theme/zerodark-theme.el" user-emacs-directory))
(load-theme 'zerodark t)

;; smart-mode-line
;; (setq sml/theme 'respectful)
;; (sml/setup)

(provide 'appearance)
;;; appearance.el ends here
