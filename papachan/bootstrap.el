;;; bootstrap.el
(defun download-elisp-files (list)
  (while list
    (let ((url (car list))
          (dir (concat user-emacs-directory "lib/")))
      (unless (file-exists-p (concat dir (url-file-nondirectory url)))
        (url-copy-file url (concat dir (url-file-nondirectory url)))))
    (setq list (cdr list))))

(defun bootstrap ()
  (setq lst '("http://raw.github.com/jschaf/emacs-lorem-ipsum/master/lorem-ipsum.el"
              "http://raw.github.com/rmm5t/insert-time.el/master/insert-time.el"
              "http://raw.github.com/jrosdahl/iflipb/master/iflipb.el"
              "https://gist.githubusercontent.com/dmgerman/5675462/raw/1af30f73c7d1f246dd69efe3cbfc327f160fca1a/directory-files-recursive.el"
              "http://raw.github.com/hayamiz/twittering-mode/master/twittering-mode.el"
              "http://raw.github.com/istib/helm-aws/master/helm-aws.el"
              "http://raw.github.com/bbetances/conf-scripts/master/emacs-dir/custom-modes/pacman.el"
              "http://raw.github.com/toctan/toggle-quotes.el/master/toggle-quotes.el"
              "https://raw.github.com/konzeptual/tea-time/master/tea-time.el"
              "https://www.emacswiki.org/emacs/download/lispxmp.el"
              "https://raw.github.com/bcbcarl/emacs-wttrin/master/wttrin.el"
              "https://raw.githubusercontent.com/informatimago/emacs/master/emacs-uptime.el"
              "https://raw.githubusercontent.com/thorsdadt/json.el/master/json.el"
              "https://raw.githubusercontent.com/Wilfred/loop.el/master/loop.el"))
  (download-elisp-files lst))

;; (bootstrap)

(provide 'bootstrap)
;;; bootstrap.el ends here
