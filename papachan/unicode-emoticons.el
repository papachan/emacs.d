;;; unicode-emoticons.el --- Shortcuts for common unicode emoticons

;;; to add it to jabber-chat or weechat

;;; (add-hook 'weechat-mode-hook 'unicode-emoticons-mode)
;;; (add-hook 'weechat-mode-hook 'abbrev-mode)

;;; (add-hook 'jabber-chat-mode-hook 'unicode-emoticons-mode)
;;; (add-hook 'jabber-chat-mode-hook 'abbrev-mode)

(define-abbrev-table 'unicode-emoticons-mode-abbrev-table
  '(("yay0" "٩(⁎❛ᴗ❛⁎)۶")
    ("huhu" "ヾ(^ω^*)")
    ("kiss0" "ヾ(￣◇￣)ノ〃")
    ("shrug0" "¯\\_(ツ)_/¯")
    ("sigh" "ಠ_ಠ")
    ("yuno" "(ノಠ益ಠ)ノ")
    ("flipping" "(╯°□°)╯︵ ┻━┻")
    ("sad0" "(ಥ_ಥ)")
    ("ping" "(・_・)ｽｯ")
    ("salut" "(*ﾟｰﾟ)ﾉ")
    ("fight" "(๑•̀ㅂ•́)و✧")
    ("ohm" "ᕮ☉益☉ᕭ")))

(add-to-list 'abbrev-minor-mode-table-alist
	     `(unicode-emoticons-mode ,unicode-emoticons-mode-abbrev-table))

;;;###autoload
(define-minor-mode unicode-emoticons-mode
  "Unicode-emoticons-mode enables expansion of certain keywords to
unicode emoticons. It is built as an abbrev table, and therefore also
needs the abbrev-mode to be enabled for it to take affect."
  :group 'unicode-emoticons
  :init-value nil)

(provide 'unicode-emoticons)
;;; unicode-emoticons.el ends here
