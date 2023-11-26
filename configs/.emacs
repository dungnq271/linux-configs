(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)

;; Load theme
;; (load-theme 'zenburn t)
;; (load-theme 'modus-vivendi)
;; (load-theme 'spacemacs-dark t)
;; (load-theme 'solarized-light t)
;; (require 'color-theme-sanityinc-tomorrow)
;; (load-theme 'monokai t)
;; (load-theme 'dracula t)

;; Add a space after line number
(setq linum-format "%d ")

;; Standard package.el + MELPA setup
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


; disable menu bar at start up
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; enable electric pair mode
(electric-pair-mode 1)
;; global-display-line-nuber
;; (global-display-line-numbers-mode 1)
;; show-paren-mode
(show-paren-mode 1)

;; visual line mode
(visual-line-mode 1)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)


;; Add better packages than default
(defvar myPackages
 '(better-defaults
   elpy
   flycheck
   py-autopep8
   material-theme
   exec-path-from-shell
   pyenv-mode
   )
 )

;; install all packages in list
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)


;; Load dracula-theme
;;(load-theme 'dracula t)
;;(setq dracula-use-24-bit-colors-on-256-colors-terms t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

;; (unless (display-graphic-p)
;;  (set-face-background 'default "black" nil ))
;;  (set-face-background 'default "#262626" nil ))

;; Load material-theme
(setq inhibit-startupp-message t) ;; hide the startup message
;; (load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

(elpy-enable)

;; (pyenv-mode)
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i --simple-prompt")

;; Window package
(global-set-key (kbd "M-o") 'ace-window)

(when (require 'flycheck nil t)
(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
(add-hook 'elpy-mode-hook 'flycheck-mode))
 
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
 
(use-package all-the-icons
  :if (display-graphic-p))
(setq neo-theme 'nerd)
 
(global-set-key [f8] 'neotree-toggle)
 
(setq
 browsse-url-browser-function 'eww-browse-url
 shr-use-fonts nil
 shr-use-colors nil
 shr-indentation 2
 shr-width 70
 eww-search-prefix "https://wiby.me/?q=")

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(inhibit-startup-screen t)
;;  '(package-selected-packages
;;    '(ace-window hl-todo zenburn-theme cmake-mode with-editor websocket use-package spacemacs-theme solarized-theme request py-autopep8 polymode neotree multiple-cursors monokai-theme modus-themes material-theme jedi indent-tools elpy dracula-theme doom-themes dash csv-mode color-theme-sanityinc-tomorrow better-defaults atom-one-dark-theme anaphora all-the-icons)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(material))
 '(custom-safe-themes
   '("f480b1a3d3ae7e5af21866b3214cdcdaf0f01830f6a189f572d155e323abb4ac" "356823de0567bf948354af8a2ab85db31612b8c299d243c5448e7c77866c2573" "05626f77b0c8c197c7e4a31d9783c4ec6e351d9624aa28bc15e7f6d6a6ebd926" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" "f149d9986497e8877e0bd1981d1bef8c8a6d35be7d82cba193ad7e46f0989f6a" "1d78d6d05d98ad5b95205670fe6022d15dabf8d131fe087752cc55df03d88595" default))
 '(package-selected-packages
   '(ace-window hl-todo py-autopep8 csv-mode auto-save-buffers-enhanced slurm-mode dockerfile-mode ein java-imports markdown-preview-mode markdown-preview-eww markdown-mode neotree dracula-theme github-theme pyvenv-auto pyenv-mode material-theme exec-path-from-shell elpy better-defaults auto-highlight-symbol auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Use shell's $PATH
(exec-path-from-shell-copy-env "PATH")

;; This code section is for preventing generating ~ files
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs-backups")))
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Auto save after 10 seconds
(global-auto-revert-mode t)
(auto-save-visited-mode t)
(setq auto-save-interval 10)

;; Highlight ToDos
(use-package hl-todo
    :hook (prog-mode . hl-todo-mode)
    :config
    (setq hl-todo-highlight-punctuation ":"
          hl-todo-keyword-faces
          `(("TODO"       warning bold)
            ("FIXME"      error bold)
            ("HACK"       font-lock-constant-face bold)
            ("REVIEW"     font-lock-keyword-face bold)
            ("NOTE"       success bold)
            ("DEPRECATED" font-lock-doc-face bold))))
