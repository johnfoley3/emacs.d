;;; utilities.el -- Utility functions to load at start. -*- lexical-binding: t; -*-

;; Copyright (C) 2018 John Foley <johnfoley.rocks>

;;; Commentary:

;; Functions to load at start.  These are specifically functions that shouldn't depend on specific
;; packages that aren't bundled in Emacs, i.e. no (require 'third-party-package)

;;; Code:

(defadvice load-theme (before theme-dont-propagate activate)
  "Advises 'load-theme' that it should disable all other custom enabled themes first."
 (mapcar #'disable-theme custom-enabled-themes))

(defun darwin? ()
  "Figure out if the system type is osx."
  (eq system-type 'darwin))

(defun windows? ()
  "Figure out if the system type is Windows."
  (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

;; https://stackoverflow.com/questions/10363982/how-can-i-open-a-temporary-buffer
(defun generate-buffer ()
  "Create a unique buffer with a temporary name involving 'scratch'."
  (interactive)
  (switch-to-buffer (make-temp-name "scratch")))

(defun newline-and-center-point ()
  "Move and center point from in the middle of a new block like structure."
  (interactive)
  (newline-and-indent) (newline-and-indent) (forward-line -1) (indent-according-to-mode))
(global-set-key (kbd "C-c C-c d") 'newline-and-center-point)

(defun refresh-dev ()
  "Ensures packages are up to date and rebuilds database."
  (interactive)
  (let ((default-directory "/Users/jfoley/projects/intoxitrack-service"))
    (compile "bundle install && bundle exec rails intox:respawn && cd intoxitrack-webclient && yarn && npm run build-test")))

(defun current-timestamp ()
  "Insert the current date time string in ISO8601 format.  Use %Y-%m-%dT%H:%M:%S%z format."
   (interactive)
   (insert (format-time-string "%FT%T%z")))

(require 'calendar)
(defun insert-current-date (&optional omit-day-of-week-p)
  "Insert the current date string.  Will omit day of the week given a prefix OMIT-DAY-OF-WEEK-P optional arg."
  (interactive)
  (insert (calendar-date-string (calendar-current-date) nil omit-day-of-week-p)))

;; From http://stackoverflow.com/a/7250027/693712
(defun smart-line-beginning ()
  "Move point to the beginning of text on the current line; if that is already the current position of point, then move it to the beginning of the line."
  (interactive)
  (let ((pt (point)))
    (beginning-of-line-text)
    (when (eq pt (point))
      (beginning-of-line))))
(add-hook 'prog-mode-hook (lambda () (local-set-key (kbd "C-a") 'smart-line-beginning)))

;; useful for when a file depends on having a trailing whitespace, such as Rails structure.sql files
(defun foley-save-without-deleting-trailing-whitespace ()
  "Will unset the global delete trailing whitespace hook on save, save, then add it back."
  (interactive)
  (remove-hook 'before-save-hook 'delete-trailing-whitespace)
  (save-buffer)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(provide 'utilities)
;;; utilities.el ends here
