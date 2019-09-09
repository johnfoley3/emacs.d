;;; utilities.el -- Utility functions to load at start. -*- lexical-binding: t; -*-

;; Copyright (C) 2018 John Foley <johnfoley.rocks>

;;; Commentary:

;; Functions to load at start.  These are specifically functions that shouldn't depend on specific
;; packages that aren't bundled in Emacs, i.e. no (require 'third-party-package)

;;; Code:

(defadvice load-theme (before theme-dont-propagate activate)
  "Advises 'load-theme' that it should disable all other custom enabled themes first."
 (mapc #'disable-theme custom-enabled-themes))

(defun darwin? ()
  "Figure out if the system type is osx."
  (eq system-type 'darwin))

(defun windows? ()
  "Figure out if the system type is Windows."
  (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

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

(defun file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun move-line-to-previous-line ()
  "Copy the current line up to the end of the previous line."
  (interactive)
  (move-beginning-of-line  nil) (set-mark-command nil)
  (forward-line -1) (end-of-line) (delete-char 1))
(global-set-key (kbd "C-c C-a") 'move-line-to-previous-line)

(defun copy-line (arg)
  "Copy lines (as many as ARG prefix argument) in the kill ring."
  (interactive "p")
  (smart-line-beginning)
  (read-only-mode 1)
  (kill-line arg)
  (read-only-mode 0)
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(defun foley/add-project (addr)
  "Clone a git SSH formatted ADDR into a filesystem location formatted by host/organization/project, then add as a Projectile project."
  (interactive "s")
  (let* ((addr-regex ".*\@\\(.*\\):\\(.*\\)/\\(.*\\)\.git")
         (matches-list (s-match-strings-all addr-regex addr))
         (matches (car matches-list))
         (host (nth 1 matches))
         (org (nth 2 matches))
         (project (nth 3 matches)))
    (make-directory "projects" "~")
    ;; (make-directory (concat "projects" "/" "testing123") "~")
    ))

(provide 'utilities)
;;; utilities.el ends here
