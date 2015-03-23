;; packages
(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("org" . "http://orgmode.org/elpa/")
                  ("ELPA" . "http://tromey.com/elpa/")
                  ("gnu" . "http://elpa.gnu.org/packages/")))
     (add-to-list 'package-archives source))
(package-initialize)

