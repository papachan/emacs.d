;;; init-repo.el --- Summary
;;; Commentary:
;;; Code:
(require 'package)
(dolist (source '(("gnu" . "http://elpa.gnu.org/packages/")
                  ("melpa" . "https://melpa.org/packages/")
                  ("org" . "http://orgmode.org/elpa/")
                  ("melpa-stable" . "http://stable.melpa.org/packages/")))
  (add-to-list 'package-archives source t))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
;; (require 'use-package-ensure)
;; (setq use-package-always-ensure t)

(provide 'init-repo)
;;; init-repo ends here
