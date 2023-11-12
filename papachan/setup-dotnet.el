;;; setup-dotnet --- load emacs theme here
;;; Commentary:

;;; Code:
(add-to-list 'auto-mode-alist '("\\.fsproj\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.axaml\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xaml\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.csproj\\'" . xml-mode))

(use-package dotnet
  :hook (csharp-mode . dotnet-mode))

(provide 'setup-dotnet)
;;; setup-dotnet.el ends here
