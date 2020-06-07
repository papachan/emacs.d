;;; setup-gnus.el
;;
(require 'gnus)

(setq gnus-save-newsrc-file nil
      gnus-read-newsrc-file nil
      gnus-select-method '(nnnil "")
      gnus-secondary-select-methods
      '((nnimap "mail.example.com"
                (nnimap-address "mail.example.com")
                (nnimap-port "imaps")
                (nnir-search-engine imap)
                (nnimap-stream ssl))))

(setq gnus-posting-styles
      '((".*"
	 (address "your_email")
	 (name "your_name"))))

(provide 'setup-gnus)
;;; setup-gnus.el ends here
