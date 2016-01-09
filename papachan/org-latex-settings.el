;;; org-latex-settings.el
;;

(require 'org-latex)
(setq org-export-latex-listings t)
(setq org-export-latex-packages-alist '())
(add-to-list 'org-export-latex-packages-alist '("" "listings"))
(add-to-list 'org-export-latex-packages-alist '("" "color"))

(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

(setq latex-run-command "pdflatex")

(provide 'org-latex-settings)
;;; org-latex-settings ends here