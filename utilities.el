;;; utilities.el -- Utility functions to load at start. -*- lexical-binding: t; -*-

;; Copyright (C) 2018 John Foley <johnfoley.rocks>

;;; Commentary:

;; Functions to load at start.  These are specifically functions that shouldn't depend on specific
;; packages that aren't bundled in Emacs, i.e. no (require 'third-party-package)

;;; Code:

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

(defun build-test ()
  "Ensures packages are up tod ate and builds the bundle file for the front end."
  (interactive)
  (let ((default-directory "/Users/jfoley/projects/intoxitrack-service/intoxitrack-webclient"))
    (compile "yarn && npm run build-test")))

(defun current-timestamp ()
  "Insert the current date time string in ISO8601 format.  Use %Y-%m-%dT%H:%M:%S%z format."
   (interactive)
   (insert (format-time-string "%FT%T%z")))

(require 'calendar)
(defun insert-current-date (&optional omit-day-of-week-p)
  "Insert the current date string.  Will omit day of the week given a prefix OMIT-DAY-OF-WEEK-P optional arg."
  (interactive)
  (insert (calendar-date-string (calendar-current-date) nil omit-day-of-week-p)))

(provide 'utilities)
;;; utilities.el ends here
