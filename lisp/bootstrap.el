;;; bootstrap.el
(setq elisp-file-list (list '("lorem-ipsum.el"
                    "http://raw.github.com/jschaf/emacs-lorem-ipsum/master/lorem-ipsum.el")
                  '("insert-time.el"
                    "http://raw.github.com/rmm5t/insert-time.el/master/insert-time.el")
                  '("iflipb.el"
                    "http://raw.github.com/jrosdahl/iflipb/master/iflipb.el")
                  '("directory-files-recursive.el"
                    "https://gist.githubusercontent.com/dmgerman/5675462/raw/1af30f73c7d1f246dd69efe3cbfc327f160fca1a/directory-files-recursive.el")
                  '("twittering-mode.el"
                    "http://raw.github.com/hayamiz/twittering-mode/master/twittering-mode.el")
                  '("helm-aws.el"
                    "http://raw.github.com/istib/helm-aws/master/helm-aws.el")))

(defun download-elisp-files (list)
  (while list
    (let* ((n (car (car list)))
          (url (car (cdr (car list))))
          (dir (concat dotemacs-dir "lib/")))
      (unless (file-exists-p (concat dir n))
        (url-copy-file url (concat dir (url-file-nondirectory url)))))
    (setq list (cdr list))))

(provide 'bootstrap)
;;; bootstrap.el ends here


