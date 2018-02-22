;;; multi-term.el -- Adds multi-term package -*- lexical-binding: t; -*-

;; Copyright (C) 2018 John Foley <johnfoley.rocks>

;;; Commentary:

;; Installs multi-term package and sets up any config and helper funtions.

;;; Code:

(use-package multi-term)

(require 'multi-term)
(defun ssh (ssh-to)
  "Spin up an SSH terminal to the given SSH-TO argument."
  (interactive "sSSH to: ")
  (let ((multi-term-program "ssh")
        (multi-term-buffer-name ssh-to)
        (multi-term-program-switches ssh-to))
    (multi-term)))
;;; multi-term.el ends here
