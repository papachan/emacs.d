;;; ido-snippet.el --- -*- lexical-binding: nil; -*-
;;; Commentary:
;;; Code:
(require 'ido)

(use-package ido
  :init
  (defun ido-disable-line-truncation ()
    (set (make-local-variable 'truncate-lines) nil))

  (defun ido-define-keys ()
    "Navigate the vertical ido list with the arrow keys."
    (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
    (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))

  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (add-hook 'ido-setup-hook 'ido-define-keys)
  :config
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ;; ido-everywhere t
        ido-auto-merge-work-directories-length nil
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-use-virtual-buffers t
        ido-handle-duplicate-virtual-buffers 2
        ido-max-prospects 10)
  (setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))))

(provide 'ido-snippet)
;;; ido-snippet ends here