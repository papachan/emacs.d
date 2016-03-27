;;; setup-erlang.el -- erlang setup
(require 'erlang-start)
(require 'erlang)

(use-package erlang
  :ensure t
  :mode
  (("\\.erl\\'" . erlang-mode)
   ("\\.hrl\\'" . erlang-mode))
  :init
  (add-hook 'erlang-mode-hook (lambda ()
                                'electric-indent-mode
                                'pending-delete-mode
                                'electric-layout-mode
                                'projectile-on
                                (local-set-key (kbd "RET") 'newline-and-indent)
                                (imenu-add-to-menubar "imenu")
                                (define-key erlang-mode-map (kbd "C-c i m") 'tempo-template-erlang-module)))
  
  (setq erlang-compile-extra-opts '(debug_info))
  ;; (add-to-list 'projectile-globally-ignored-directories "_build")
  
  :config
  (progn

    ;; rebar3
    (defun inferior-erlang-with-rebar3-auto ()
      (interactive)
      (inferior-erlang '"rebar3 auto"))    
    (setq erlang-shell-function 'inferior-erlang-with-rebar3-auto)))

(provide 'setup-erlang)
;;; setup-erlang.el ends here 
