;;; init-org.el --- Summary
;;; Commentary:
;;; Code:

(org-babel-do-load-languages
      'org-babel-load-languages '((shell . t)
                                  (emacs-lisp . t)
                                  (clojure . t)
                                  (python . t)))

(provide 'init-org)
;;; init-org.el ends here
