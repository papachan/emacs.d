;;; init-elfeed.el
(use-package elfeed
  :defer t
  :commands elfeed
  :init
  (setq elfeed-feeds
        '(("https://news.ycombinator.com/rss")

          ("http://nedroid.com/feed/" webcomic)
          ("http://www.commitstrip.com/fr/feed/" webcomic)          

          ("https://www.reddit.com/r/emacs/.rss" emacs)
          ("http://planet.emacsen.org/atom.xml" emacs)

          ("https://www.reddit.com/r/lisp/.rss" lisp)
          ("https://www.reddit.com/r/Common_Lisp/.rss" lisp)

          ("https://www.reddit.com/r/Clojure/.rss" clojure)

          ("https://www.reddit.com/r/freebsd/.rss" freebsd)))
  :config
  (global-set-key (kbd "C-c u") 'elfeed-update))

(provide 'init-elfeed)
;;; init-elfeed.el ends here 
