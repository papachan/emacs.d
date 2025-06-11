;;; init-org.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(org-babel-do-load-languages
      'org-babel-load-languages '((shell . t)
                                  (emacs-lisp . t)
                                  (clojure . t)
                                  (python . t)))

(add-hook 'org-mode-hook
  (lambda ()
    (setq display-line-numbers-mode nil)))

(provide 'init-org)
;;; init-org.el ends here
