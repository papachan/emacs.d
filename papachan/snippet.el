; adding html snippet 
(defun snippet-html ()
  (lambda())
  (interactive)
  (insert "<!DOCTYPE html>\n<html>\n<head>\n    <title></title>\n</head>\n<body>\n\n</body>\n</html>"))

(defun snippet-latin ()
  (lambda())
  (interactive)
  (insert "iso-8859-1"))

(global-set-key (kbd "C-c v") 'snippet-html)
(global-set-key (kbd "C-c i") 'snippet-latin)

(provide 'snippet)
