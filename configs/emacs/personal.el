;;
;; .emacs.d/init.el
;;

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    material-theme                  ;; Theme
    elpy                            ;; Emacs Lisp Python Environment
    flycheck                        ;; On the fly syntax checking
    py-autopep8                     ;; Run autopep8 on save
    blacken                         ;; Black formatting on save
    ;; ein                             ;; Emacs IPython Notebook
    exec-path-from-shell
    pyenv-mode    
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================
(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-display-line-numbers-mode 1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq linum-format "%d ")           ;; Add a space after line number

;; ====================================
;; Development Setup
;; ====================================

;; Enable elpy
;; (elpy-enable)
(use-package elpy
     :ensure t
     :init
     (elpy-enable))
(setq elpy-rpc-virtualenv-path 'current)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (add-to-list 'flycheck-disabled-checkers 'python-mypy)
)

;; Enable autopep8
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; (add-hook 'elpy-mode-hook 'py-autopep8-mode)

;; Use IPython for REPL
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")

;; (pyenv-mode)
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i --simple-prompt")

(put 'erase-buffer 'disabled nil)      ;; Enable erase-buffer command
(delete-selection-mode +1)             ;; Replace when select rather than insert

;; ===================================
;; Theme Customization
;; ===================================
;; (load-theme 'zenburn t)
;; (load-theme 'modus-vivendi)
;; (load-theme 'spacemacs-dark t)
;; (load-theme 'solarized-light t)
;; (require 'color-theme-sanityinc-tomorrow)
;; (load-theme 'monokai t)
;; (load-theme 'dracula t)

; Disable menu bar at start up
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Automatically close opening delimiters
(electric-pair-mode 1)

;; See matching pairs of parentheses and other characters
(show-paren-mode 1)

;; Visual line mode
(visual-line-mode 1)

;; yaml mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

; start auto-complete with emacs
;; (require 'auto-complete)
;; do default config for auto-complete
;; (require 'auto-complete-config)
;; (ac-config-default)

;; Resizing window
(global-set-key (kbd "C-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<down>") 'shrink-window)
(global-set-key (kbd "C-S-<up>") 'enlarge-window)

;; Ace window
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-background nil)

;; Faster moving window
(global-set-key (kbd "M-S-<left>") 'windmove-left)          ; move to left window
(global-set-key (kbd "M-S-<right>") 'windmove-right)        ; move to right window
(global-set-key (kbd "M-S-<up>") 'windmove-up)              ; move to upper window
(global-set-key (kbd "M-S-<down>") 'windmove-down)          ; move to lower window
 
;; Setup for directory tree
(use-package all-the-icons
  :if (display-graphic-p))
(setq neo-theme 'nerd)
 
(global-set-key [f7] 'neotree-toggle)
(setq neo-smart-open t)
 
;; Browser search
;; (setq
;;  browsse-url-browser-function 'eww-browse-url
;;  shr-use-fonts nil
;;  shr-use-colors nil
;;  shr-indentation 2
;;  shr-width 70
;;  eww-search-prefix "https://wiby.me/?q=")

;; ===================================
;; JS & TS
;; ===================================

;; Indentation
(setq-default js-indent-level 2
	      js2-basic-offset 2)

;; Language Server Protocol
(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'js-mode-hook 'lsp))

;; Navigation
(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil)
)

(yas-global-mode 1)

;; Quick lint
(add-to-list 'load-path "~/.emacs/quick-lint-js-emacs")

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c .") 'mc/mark-all-like-this)

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
;; (use-package hl-todo
;;     :hook (prog-mode . hl-todo-mode)
;;     :config
;;     (setq hl-todo-highlight-punctuation ":"
;;           hl-todo-keyword-faces
;;           `(("TODO"       warning bold)
;;             ("FIXME"      error bold)
;;             ("HACK"       font-lock-constant-face bold)
;;             ("REVIEW"     font-lock-keyword-face bold)
;;             ("NOTE"       success bold)
;;             ("DEPRECATED" font-lock-doc-face bold))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages
   '(typescript-mode lsp-mode hl-todo yaml-mode use-package pyenv-mode neotree multiple-cursors material-theme flycheck exec-path-from-shell elpygen elpy better-defaults auto-complete all-the-icons ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
