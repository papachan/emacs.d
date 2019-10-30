;; packages
(dolist (source '(("melpa" . "https://melpa.org/packages/")
                  ("org" . "http://orgmode.org/elpa/")))
     (add-to-list 'package-archives source t))
(package-initialize)
