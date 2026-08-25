;;; init-org.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(org-babel-do-load-languages
      'org-babel-load-languages '((shell . t)
                                  (emacs-lisp . t)
                                  (clojure . t)
                                  (python . t)))

(setq python-indent-offset 4)

(provide 'init-org)
;;; init-org.el ends here
