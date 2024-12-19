;;; setup-webmode.el --- Summary
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
        web-mode-code-indent-offset 2
        web-mode-markup-indent-offset 2
        web-mode-extra-snippets
        '(("erb" . (("toto" . ("<% toto | %>\n\n<% end %>"))))
          ("php" . (("dowhile" . ("<?php do { ?>\n\n<?php } while (|); ?>"))
                    ("debug" . ("<?php error_log(__LINE__); ?>")))))))

(use-package javascript
  :defer t
  :commands javascript-mode
  :mode ("\\.jsx\\'" . javascript-mode)
  :init
  :config
  (custom-set-variables
   '(js-indent-level 2)))

(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode))
  :config
  (setq typescript-indent-level 2))

(provide 'setup-webmode)
;;; setup-webmode.el ends here
