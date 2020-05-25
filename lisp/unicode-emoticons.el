;;; unicode-emoticons.el --- Shortcuts for common unicode emoticons

;; Copyright (C) 2015 Gunther Hagleitner

;; Author: Gunther Hagleitner
;; Version: 0.1
;; Package-Version: 20150204.508
;; Keywords: games, entertainment, comms
;; URL: https://github.com/hagleitn/unicode-emoticons
;; Package-Requires: ()

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ## Installation

;; Install unicode-emoticons from [MELPA](melpa.org) with:

;; M-x package-install RET unicode-emoticons

;;; to add it to jabber-chat or weechat

;;; (add-hook 'weechat-mode-hook 'unicode-emoticons-mode)
;;; (add-hook 'weechat-mode-hook 'abbrev-mode)

;;; (add-hook 'jabber-chat-mode-hook 'unicode-emoticons-mode)
;;; (add-hook 'jabber-chat-mode-hook 'abbrev-mode)

;;; Commentary:
;;
;; Simple minor mode that let's you quickly type common unicode
;; emoticons. Emoticons are stored as abbrev definitions. To enable:
;; M-x unicode-emoticons-mode <RET>
;; M-x abbrev-mode <RET>
;;
;; After that you can type "shrug0" which will expand to:
;; ¯\_(ツ)_/¯
;;
;; In order to see the definitions: M-x list-abbrevs <RET>
;;
;;; Code:

(define-abbrev-table 'unicode-emoticons-mode-abbrev-table
  '(("yay0" "٩(⁎❛ᴗ❛⁎)۶")
    ("face0" "( ͡° ͜ʖ ͡° )")
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
    ("ohm" "ᕮ☉益☉ᕭ")
    ("buh" "(≧▽≦)/")))

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
