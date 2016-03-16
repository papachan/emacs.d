;;; erlang-config.el
(require 'erlang-start)
;;(require 'erlang)

(add-hook 'erlang-mode-hook 'electric-indent-mode)
(add-hook 'erlang-mode-hook 'pending-delete-mode)
(add-hook 'erlang-mode-hook 'electric-layout-mode)
;; (add-hook 'erlang-mode-hook 'font-lock-comment-annotations)
(add-hook 'erlang-mode-hook 'projectile-on)
(add-hook 'erlang-mode-hook
          (lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(add-hook 'erlang-mode-hook
          (lambda () (imenu-add-to-menubar "imenu")))

;; (let* ((dir "/usr/lib/erlang/"))
;;   (when (file-accessible-directory-p dir)
;;     (setq erlang-root-dir dir)
;;     (add-to-list 'load-path
;;          (concat dir
;;              "lib/"
;;              (car (file-name-all-completions "tools-" (concat dir "lib")))
;;              "emacs"))
;;     (add-to-list 'exec-path (concat dir "bin"))
;;     (defvar inferior-erlang-prompt-timeout t)))

;; rebar3
(defun inferior-erlang-with-rebar3-auto ()
  (interactive)
  (inferior-erlang '"rebar3 auto"))
(setq erlang-shell-function 'inferior-erlang-with-rebar3-auto)

(provide 'erlang-config)
;;; erlang-config.el ends here
