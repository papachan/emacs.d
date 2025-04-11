;;; setup-web.el --- -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:
(use-package web-mode
  :ensure t
  :defer t
  :bind ("C-c C-;" . web-mode-comment-or-uncomment)
  :mode ("\\.html\\'" . web-mode)
  :config
  (setq js-indent-level 2
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(use-package javascript
  :defer t
  :commands javascript-mode
  :mode (("\\.json\\'" . javascript-mode)
         ("\\.jsx\\'" . javascript-mode)
         ("\\.mjs\\'" . javascript-mode))
  :init
  :config
  (custom-set-variables
   '(js-indent-level 2)))

(use-package typescript-mode
  :defer t
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode))
  :config
  (setq typescript-indent-level 2))


(provide 'setup-web)
;;; setup-web.el ends here
