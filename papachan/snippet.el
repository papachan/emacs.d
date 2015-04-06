; adding html snippet 
(defun snippet-html ()
  (lambda())
  (interactive)
  (insert "<!DOCTYPE html>\n<html>\n<head>\n    <title></title>\n</head>\n<body>\n\n</body>\n</html>"))
(global-set-key "\C-cv" 'snippet-html)
;(global-set-key (kbd "C-c C-v") 'snippet-html)


