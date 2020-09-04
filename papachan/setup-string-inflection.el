;;; setup-string-inflection.el --- lsp-mode
;;; Commentary:
;;; Code:
 (use-package string-inflection
      :bind (("C-c C-u" . string-inflection-all-style-cycle)
             :map ruby-mode-map
             ("C-c C-u" . string-inflection-ruby-style-cycle)
             :map java-mode-map
             ("C-c C-u" . string-inflection-java-style-cycle)
             :map groovy-mode-map
             ("C-c C-u" . string-inflection-java-style-cycle)
             :map python-mode-map
             ("C-c C-u" . string-inflection-python-style-cycle)))


(provide 'setup-string-inflection)
;;; setup-string-inflection.el ends here
