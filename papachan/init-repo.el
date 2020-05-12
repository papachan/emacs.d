;;; init-repo.el
(dolist (source '(("gnu" . "http://elpa.gnu.org/packages/")
                  ("melpa" . "https://melpa.org/packages/")
                  ("org" . "http://orgmode.org/elpa/")
                  ("melpa-stable" . "http://stable.melpa.org/packages/")))
     (add-to-list 'package-archives source t))
(package-initialize)

(provide 'init-repo)

