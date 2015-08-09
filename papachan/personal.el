(cond
 ((string-equal system-type "darwin")
  (progn
    ;(set-default-font "Monaco 16")
    ;(set-default-font "Liberation Mono 14")
    (set-default-font "Menlo 12")))
 ((string-equal system-type "gnu/linux")
  (progn
    (set-default-font "Ubuntu Mono 12"))))

(defun increase-font-size ()
  (set-face-attribute 'default (selected-frame) :height (+ (face-attribute 'default :height) 10)))

(defun decrease-font-size ()
  (set-face-attribute 'default (selected-frame) :height (- (face-attribute 'default :height) 10)))

