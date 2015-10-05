;; webmode.el

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(use-package web-mode
  :config
  (progn
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-extra-snippets
      '(("erb" . (("toto" . ("<% toto | %>\n\n<% end %>"))))
        ("php" . (("dowhile" . ("<?php do { ?>\n\n<?php } while (|); ?>"))
                  ("debug" . ("<?php error_log(__LINE__); ?>"))))
       ))))

(provide 'webmode)
;;; webmode.el ends here
