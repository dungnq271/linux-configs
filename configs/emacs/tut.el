;;
;; .config/emacs/tut.el
;;

(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
		       ("melpa" . "https://melpa.org/packages/")
		       ("melpa-stable" . "https://stable.melpa.org/packages/")
		       ("gnu" . "https://elpa.gnu.org/packages/")
		       )))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (use-package helm
;;   :ensure t
;;   :config (helm-mode 1))

;; (use-package helm-projectile
;;   :ensure t
;;   :config (helm-projectile-on))

;; Custom key binding
(keymap-global-set "M-S-<left>" 'windmove-left)
(keymap-global-set "M-S-<right>" 'windmove-right)
(keymap-global-set "M-S-<up>" 'windmove-up)
(keymap-global-set "M-S-<down>" 'windmove-down)

(org-babel-load-file (expand-file-name "~/.emacs.d/my-tut.org"))
