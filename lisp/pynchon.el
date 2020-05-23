;; Great quotes from Thomas Pynchon
;; https://en.wikiquote.org/wiki/Thomas_Pynchon

(defvar quotes
  '("\"Why should things be easy to understand?\"         - Thomas Pynchon"
    "\"There is nothing so loathsome as a sentimental surrealist.\"         - Thomas Pynchon, Gravity's Rainbow"
    "\"Though it is not often that death is so clearly told to fuck off\"         - Thomas Pynchon"
    "\"A screaming comes across the sky.\"         - Thomas Pynchon"
    "\"Danger's over, Banana Breakfast is saved\"         - Thomas Pynchon"
    "\"You may never get to touch the Master, but you can tickle his creatures.\"         - Thomas Pynchon"
    "\"Paranoids are not paranoid because they're paranoid, but because they keep putting themselves, fucking idiots, deliberately into paranoid situations.\"         - Thomas Pynchon"
    "\"If they can get you asking the wrong questions, they don't
 have to worry about answers.\"         - Thomas Pynchon Gravity's Rainbow"
    "\"You hide, they seek.\"         - Thomas Pynchon Gravity's Rainbow"
    "\"You may never get to touch the Master, but you can tickle his creatures.\"         - Thomas Pynchon"
    "\"Through the machineries of greed, pettiness, and the abuse of power, love occurs.\"         - Thomas Pynchon"))

(defun random-quotes ()
    (setq frame-title-format
          (nth (random (length quotes)) quotes)))

(provide 'pynchon)
