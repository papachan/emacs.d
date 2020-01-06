;; setup-webmode.el
(require 'web-mode)

(use-package web-mode
  :ensure t
  :defer t
  :bind ("C-c C-;" . web-mode-comment-or-uncomment)
  :mode (("\\.html?\\'"  . web-mode)
         ("\\.phtml\\'"  . web-mode)
         ("\\.tpl\\'"    . web-mode)
         ("\\.jsp\\'"    . web-mode)
         ("\\.gsp\\'"    . web-mode)
         ("\\.gs\\'"     . web-mode)
         ("\\.twig\\'"   . web-mode)
         ("\\.css\\'"    . web-mode)
         ("\\.eex\\'"    . web-mode)
         ("\\.js[x]?\\'" . web-mode)
         ("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))
  :config
  (progn
    (setq js-indent-level 2)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-extra-snippets
      '(("erb" . (("toto" . ("<% toto | %>\n\n<% end %>"))))
        ("php" . (("dowhile" . ("<?php do { ?>\n\n<?php } while (|); ?>"))
                  ("debug" . ("<?php error_log(__LINE__); ?>"))))
       ))))

(provide 'setup-webmode)
;;; webmode.el ends here
