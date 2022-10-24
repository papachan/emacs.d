
;;; setup-dotnet --- load emacs theme here
;;; Commentary:

;;; Code:


(use-package dotnet
  :hook (csharp-mode . dotnet-mode)
  :init
  (add-to-list 'auto-mode-alist '("\\.fsproj\\'" . xml-mode))
  (add-to-list 'auto-mode-alist '("\\.axaml\\'" . xml-mode))
  (add-to-list 'auto-mode-alist '("\\.xaml\\'" . xml-mode))
  (add-to-list 'auto-mode-alist '("\\.csproj\\'" . xml-mode)))

(provide 'setup-dotnet)
