;;; init-repo.el --- Summary. -*- lexical-binding: nil; -*-

;;; Commentary:
;;; Code:
(require 'package)
(dolist (source '(("gnu" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")
                  ("melpa" . "https://melpa.org/packages/")
                  ("melpa-stable" . "http://stable.melpa.org/packages/")))
  (add-to-list 'package-archives source t))

(setq package-archive-priorities '(("gnu" . 1)
                                   ("melpa-stable" . 2)
                                   ("melpa" . 3)))

(package-initialize)

;; (unless (package-installed-p 'use-package)
;;   (package-install 'use-package))

(provide 'init-repo)
;;; init-repo.el ends here
