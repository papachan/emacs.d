;;; setup-web.el --- -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:
(use-package css-mode
  :mode (("\\.css\\'"   . css-mode)
         ("\\.scss\\'"  . css-mode)))

(use-package web-mode
  :ensure t
  :defer t
  :bind ("C-c C-;" . web-mode-comment-or-uncomment)
  :mode (("\\.html?\\'" . web-mode)
         ("\\.phtml\\'" . web-mode)
         ("\\.tpl\\'"   . web-mode)
         ("\\.jsp\\'"   . web-mode)
         ("\\.gsp\\'"   . web-mode)
         ("\\.gs\\'"    . web-mode)
         ("\\.twig\\'"  . web-mode)
         ("\\.eex\\'"   . web-mode)
         ("\\.ejs\\'"   . web-mode)
         ("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))
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
  (setq js-indent-level 2
        typescript-ts-mode-indent-offset 2
        json-ts-mode-indent-offset 2))

(use-package typescript-mode
  :defer t
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode))
  :config
  (setq typescript-indent-level 2))

(provide 'setup-web)
;;; setup-web.el ends here