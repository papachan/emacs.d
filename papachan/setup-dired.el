;;; setup-dired.el --- -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; https://oremacs.com/2015/01/12/dired-file-size/
(defun dired-get-size ()
  "Display file size in Dired."
  (interactive)
  (let ((files (dired-get-marked-files)))
    (with-temp-buffer
      (apply 'call-process "/usr/bin/du" nil t nil "-sch" files)
      (message
       "Size of all marked files: %s"
       (progn
         (re-search-backward "\\(^[ 0-9.,]+[A-Za-z]+\\).*total$")
         (match-string 1))))))

;; http://xahlee.info/emacs/emacs/elisp_dired_rename_space_to_underscore.html
(defun xah-dired-rename-space-to-underscore ()
  "Replace space in filenames.
This function renames the currently selected or marked files in Dired
mode, replacing all spaces in their filenames with underscores (_).
  If the function is called outside of Dired mode, it raises an error."
  (interactive)
  (require 'dired-aux)
  (if (eq major-mode 'dired-mode)
      (let ((markedFiles (dired-get-marked-files )))
        (mapc (lambda (x)
                (when (string-match " " x )
                  (dired-rename-file x (replace-regexp-in-string " " "_" x) nil)))
              markedFiles)
        (revert-buffer))
    (user-error "Not in Dired")))

(use-package dired
  :config
  (progn
    (when (string= system-type "darwin") ;; Mac don't support --dired option
      (setq dired-use-ls-dired nil))
    (setq dired-dwim-target t)
    (setq display-line-numbers-mode nil)
    (define-key dired-mode-map (kbd "M-c") 'copy-file)
    (define-key dired-mode-map (kbd "M-s") 'rg)
    (define-key dired-mode-map "z" #'dired-get-size)
    (define-key dired-mode-map "_" #'xah-dired-rename-space-to-underscore)
    (define-key dired-mode-map (kbd "C-X C-m") 'compile) ;; call Makefile
    (define-key dired-mode-map "q"
                (lambda ()
                  "move to the parent directory"
                  (interactive)
                  (find-alternate-file "..")))))

(use-package dired-sidebar
  :ensure t
  ;; :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :commands (dired-sidebar-toggle-sidebar))

(use-package dired-rainbow
  :after dired
  :config
  (dired-rainbow-define lang1 "#87b524" ("clj" "cljs" "cljc" "edn"))
  (dired-rainbow-define zipped "#e92c13" ("gz" "zip"))
  (dired-rainbow-define lang2 "#b48ead" ("lua" "css" "sass" "scss" "html" "json"))
  (dired-rainbow-define text "#88c0d0" ("org" "md" "toml" "yml" "yaml" "txt"))
  (dired-rainbow-define document "#1fb7b6" ("odt" "pdf" "epub" "odp" "docx"))
  (dired-rainbow-define media "#e70bb8" ("jpg" "jpeg" "png" "gif"))
  (dired-rainbow-define csv "#76d46c" ("csv" "xlsx" "xls"))
  (dired-rainbow-define-chmod executable-unix "#bf616a" "-.*x.*"))

(provide 'setup-dired)
;;; setup-dired.el ends here
