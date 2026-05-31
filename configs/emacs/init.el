;; (load-file "~/.emacs.d/startup.el")
(load-file "~/.emacs.d/tut.el")
(setenv "LSP_USE_PLISTS" "true") ;; in early-init.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
     default))
 '(flycheck-checker-error-threshold 1000000)
 '(package-selected-packages
   '(add-node-modules-path all-the-icons amx apheleia auto-complete
			   better-defaults blacken centaur-tabs corfu
			   dap-mode dashboard doom-modeline
			   doom-themes eglot-java elpy elpygen
			   exec-path-from-shell expand-region flycheck
			   flymake-eslint helm-projectile
			   ido-completing-read+ json-mode
			   lsp-tailwindcss lsp-ui magit material-theme
			   multiple-cursors neotree npm-mode
			   org-bullets power-mode prettier prettier-js
			   py-autopep8 pyconf python-black python-mode
			   rjsx-mode ruff-format rust-mode tide
			   tree-sitter-langs treemacs-projectile
			   typescript-mode use-package vue-mode
			   web-mode which-key yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
