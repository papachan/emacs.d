;;; bootstrap.el
(setq lst '("http://raw.github.com/jschaf/emacs-lorem-ipsum/master/lorem-ipsum.el"
                        "http://raw.github.com/rmm5t/insert-time.el/master/insert-time.el"
                        "http://raw.github.com/jrosdahl/iflipb/master/iflipb.el"
                        "https://gist.githubusercontent.com/dmgerman/5675462/raw/1af30f73c7d1f246dd69efe3cbfc327f160fca1a/directory-files-recursive.el"
                        "http://raw.github.com/hayamiz/twittering-mode/master/twittering-mode.el"
                        "http://raw.github.com/istib/helm-aws/master/helm-aws.el"
                        "http://raw.github.com/bbetances/conf-scripts/master/emacs-dir/custom-modes/pacman.el"
                        "http://raw.github.com/toctan/toggle-quotes.el/master/toggle-quotes.el"
                        "https://raw.github.com/konzeptual/tea-time/master/tea-time.el"
                        "https://www.emacswiki.org/emacs/download/lispxmp.el"))

(defun download-elisp-files (list)
  (while list
    (let ((url (car list))
          (dir (concat dotemacs-dir "lib/")))
      (unless (file-exists-p (concat dir (url-file-nondirectory url)))
        (url-copy-file url (concat dir (url-file-nondirectory url)))))
    (setq list (cdr list))))

(defun bootstrap ()
  (download-elisp-files lst))

(provide 'bootstrap)
;;; bootstrap.el ends here


