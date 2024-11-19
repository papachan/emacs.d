;;; ob-babashka.el --- org-babel functions for ClojureScript evaluation -*- lexical-binding: t; -*-

;; Author: Adam James Vermeer
;; Maintainer: Adam James Vermeer
;; Created: 25 June 2021
;; Keywords: literate programming, reproducible research, babashka, clojure, scripting
;; Homepage: https://gist.github.com/adam-james-v/f4d2b75a70b095d14a351a1eff96b4b0
;; Package-Requires: ((emacs "24.4") (org "9.0"))

;; This file is modified from [[https://github.com/emacsmirror/ob-clojurescript/blob/master/ob-clojurescript.el][ob-clojurescript]]

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Org-babel support for evaluating Babashka code.

;; Requirements:

;; - [[https://github.com/babashka/babashka][babashka]]
;; - clojure-mode

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(require 'ob)

(defvar org-babel-tangle-lang-exts)
(add-to-list 'org-babel-tangle-lang-exts '("babashka" . "clj"))

(defvar org-babel-babashka-command (executable-find "bb")
  "The command to use to compile and run your babashka code.")

(defvar org-babel-default-header-args:babashka '())
(defvar org-babel-header-args:babashka '((package . :any)))

(defun ob-babashka-escape-quotes (str-val)
  "Escape quotes for STR-VAL so that Lumo can understand."
  (replace-regexp-in-string "\"" "\\\"" str-val 'FIXEDCASE 'LITERAL))

(defun org-babel-expand-body:babashka (body params)
  "Expand BODY according to PARAMS, return the expanded body."
  (let* ((vars (org-babel--get-vars params))
         (result-params (cdr (assq :result-params params)))
         (print-level nil) (print-length nil)
         (body (ob-babashka-escape-quotes
                (org-trim
                 (if (null vars)
                     (org-trim body)
                   (concat "(let ["
                           (mapconcat
                            (lambda (var)
                              (format "%S (quote %S)" (car var) (cdr var)))
                            vars "\n      ")
                           "]\n" body ")"))))))
    (if (or (member "code" result-params)
            (member "pp" result-params))
        (format "(print (do %s))" body)
      body)))

(defun org-babel-execute:babashka (body params)
  "Execute a block of babashka code in BODY with Babel using PARAMS."
  (let ((expanded (org-babel-expand-body:babashka body params))
        result)
    (setq result
          (org-babel-trim
           (shell-command-to-string
            (concat org-babel-babashka-command " -e \"" expanded "\""))))
    (org-babel-result-cond (cdr (assoc :result-params params))
      result
      (condition-case nil (org-babel-script-escape result)
        (error result)))))

(define-derived-mode babashka-mode clojure-mode "Babashka"
  "Major mode for editing Babashka code.")

(provide 'ob-babashka)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; ob-babashka.el ends here
