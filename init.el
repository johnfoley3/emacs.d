;;; init.el -- Ran during emacs start up to do all the things -*- lexical-binding: t; -*-

;; Copyright (C) 2018 John Foley <johnfoley.rocks>

;;; Commentary:

;; Sets up and runs all the things.  /packages holds all the package declarations and config
;; while /site holds all the instance specific things

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; (setq debug-on-error t)

;; an older version of emacs may try to load this accidentally; prevent the issue right away
(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

;; set up common config for garbage collection
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(defun expand-in-user-dir (NAME)
  "Expand NAME to an absolute path in the user Emacs' directory."
  (expand-file-name NAME user-emacs-directory))

;; Custom file for emacs custom config. Cleans up the init.el file considerably
(setq custom-file (expand-in-user-dir "custom.el"))
(load custom-file)

;; make loading files easier
(add-to-list 'load-path (expand-in-user-dir "lisp"))

(require 'utilities) ;; ./lisp/utilities.el
(require 'packages) ;; ./lisp/packages.el
(require 'fonts) ;; ./lisp/fonts.el

(add-hook 'after-init-hook
          (lambda ()
            (mapc (lambda (package-file) (load package-file))
                  (directory-files-recursively (concat user-emacs-directory "site/") "^[^\.].*\.el$"))))

(set-face-attribute 'default nil :height 160)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

(setq backup-directory-alist '(("." . "~/.backups")))

(add-hook 'after-init-hook (lambda ()
                             (load-theme 'spacemacs-dark)))

;; (add-hook 'after-init-hook (lambda ()
;;                              (if (> (string-to-number (format-time-string "%k")) 18)
;;                                  (load-theme 'solarized-dark)
;;                                (load-theme 'solarized-light))))

;;; Whitespace mode
(setq-default indent-tabs-mode nil)

;;; Quality of life.
;;; There is a util function to save _with_ trailing whitespace
;; Sometimes autogenerated files do have whitespace, and it's noisy on git
;; to add those changes automatically if I touch it
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-c j") 'join-line)

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq auto-composition-mode nil)))

(provide 'init)
;;; init.el ends here
