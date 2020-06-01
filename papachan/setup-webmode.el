;;; setup-webmode.el
;;
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
         ("\\.css\\'"   . web-mode)
         ("\\.eex\\'"   . web-mode)
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
  :mode (("\\.jsx\\'" . javascript-mode)
         ("\\.tsx\\'" . javascript-mode))
  :init
  :config
  (custom-set-variables
   '(js-indent-level 2)))

(provide 'setup-webmode)
;;; webmode.el ends here
