(require 'subr-x)

(defun read-buffer-lines (buf)
  (let ((lines '()))
    (with-current-buffer buf
      (save-excursion
        (goto-char (point-min))
        (while (not (eobp))
          (if (not (string-equal "" (buffer-substring (point) (point-at-eol))))
              (push
               (delete " " (delete "" (split-string
                                       (string-trim (buffer-substring (point) (point-at-eol)))
                                       "")))
                  lines)
              )
            (beginning-of-line 2))
        (erase-buffer) ;; clean buffer
        (nreverse lines)                ; =>
        ))))



(defun zip_list (lst)
  (let ((res))
    (while (-none? 'null lst)
      (setq res (cons (mapcar 'car lst) res))
      (setq lst (mapcar 'cdr lst)))
    (nreverse res)                      ; =>
    ))


;; this execute code into scratch buffer
(let* ((buf "*scratch*")
       (a (zip_list (read-buffer-lines buf))))
  (with-current-buffer buf
    (while a
      (progn
        ;; (format "%s" (car a))             ; =>
        (insert (mapconcat 'identity (car a) ""))
        (newline)
        (setq a (cdr a))))))
