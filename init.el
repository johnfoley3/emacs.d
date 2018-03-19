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

;; make loading files easier
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site" user-emacs-directory))

;; Custom file for emacs custom config. Cleans up the init.el file considerably
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'utilities) ;; ./lisp/utilities.el
(require 'packages) ;; ./lisp/packages.el
(require 'fonts) ;; ./lisp/fonts.el

(set-face-attribute 'default nil :height 160)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; (add-hook 'after-init-hook (lambda ()
;;                              (if (> (string-to-number (format-time-string "%k")) 18)
;;                                  (load-theme 'solarized-dark)
;;                                (load-theme 'solarized-light))))

;;; Whitespace mode
(setq-default indent-tabs-mode nil)

(define-key global-map (kbd "RET") 'newline-and-indent)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key (kbd "C-.") 'other-window)

;;; Custom Functions
;; Originally from stevey, adapted to support moving to a new directory.
;; <http://stackoverflow.com/a/1834038/693712>
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (progn
     (if (not (buffer-file-name))
         (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
                                                     (buffer-file-name)))))))
  (if (equal new-name "")
      (error "Aborted rename"))
  (setq new-name (if (file-directory-p new-name)
                     (expand-file-name (file-name-nondirectory
                                        (buffer-file-name))
                                       new-name)
                   (expand-file-name new-name)))
  ;; If the file isn't saved yet, skip the file rename, but still update the
  ;; buffer name and visited file.
  (if (file-exists-p (buffer-file-name))
      (rename-file (buffer-file-name) new-name 1))
  (let ((was-modified (buffer-modified-p)))
    ;; This also renames the buffer, and works with uniquify
    (set-visited-file-name new-name)
    (if was-modified
        (save-buffer)
      ;; Clear buffer-modified flag caused by set-visited-file-name
      (set-buffer-modified-p nil))
    (message "Renamed to %s." new-name)))

;; From http://emacsredux.com/blog/2013/04/03/delete-file-and-buffer/
;; License unknown
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(add-hook 'helm-major-mode-hook
          (lambda ()
            (setq auto-composition-mode nil)))
(add-hook 'eshell-mode-hook
          (lambda ()
            (setq auto-composition-mode nil)))

(provide 'init)
;;; init.el ends here
