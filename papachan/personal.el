(cond
 ((string-equal system-type "darwin")
  (progn
    ;(message "Mac OS")
    )
  )
 ((string-equal system-type "gnu/linux")
  (progn
    (set-default-font "Ubuntu Mono 12"))))

(defun increase-font-size ()
  (set-face-attribute 'default (selected-frame) :height (+ (face-attribute 'default :height) 10)))

(defun decrease-font-size ()
  (set-face-attribute 'default (selected-frame) :height (- (face-attribute 'default :height) 10)))

