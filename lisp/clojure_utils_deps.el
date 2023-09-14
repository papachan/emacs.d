;; [org.apache.kafka/kafka-clients "3.5.1"]
;; [org.apache.kafka/kafka_2.13 "3.5.1"]
;; [org.apache.kafka/kafka-streams "3.5.1"]
;; [org.apache.kafka/connect-json "3.5.1"]

;; (defun change-lein-deps-to-deps (my-string)
;;   (let ((my-regexp "\\[\\(.*\\)\\\s\\(.*\\)\\]"))
;;     (and (string-match my-regexp my-string)
;;          (insert (concat (match-string 1 my-string) " {:mvn/version " (match-string 2 my-string) "}")))))

;; (change-lein-deps-to-deps "[org.apache.kafka/kafka-clients \"3.5.1\"]")

(defun change-legacy-deps-to-deps ($string &optional $from $to)
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (bounds-of-thing-at-point 'paragraph)))
       (list nil (car bds) (cdr bds)))))
  (let (workOnStringP inputStr outputStr)
    (setq workOnStringP (if $string t nil))
    (setq inputStr (if workOnStringP $string (buffer-substring-no-properties $from $to)))
    (setq outputStr
          (let ((case-fold-search t))
            (and (string-match "\\[\\(.*\\)\\\s\\(.*\\)\\]" inputStr)
                 (concat (match-string 1 inputStr) " {:mvn/version " (match-string 2 inputStr) "}"))))
    (if workOnStringP
        outputStr
      (save-excursion
        (delete-region $from $to)
        (goto-char $from)
        (insert outputStr)))))
