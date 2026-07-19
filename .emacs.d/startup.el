;;; startup.el --- Choose your own config adventure
;; Author: Lukewh
;;
;;; Code:

;; ido - interactively do things
(require 'ido)

;; Define the paths to the configs
(defvar config-personal "~/.emacs.d/personal.el")
(defvar config-tut "~/.emacs.d/tut.el") 

;; Define the function
(defun startup()
  "Which init?"
  (interactive)  ; Enter interactive mode (capture user input)
  (let ((choices '("Tut" "Personal")))  ; The choices are...
    (if
	;; if the highlighted choice is personal
	(string= (ido-completing-read "Open init:" choices) "Personal")
	(load-file config-personal)  ; load the config-personal variable
      ;; otherwise
      (load-file config-tut)  ; load the config-personal variable
      )
    )
  )

;; Immediately execute startup
(startup)
;;; startup.el ends here
