;;; packages.el -- Ran during emacs start up to install and load packages

;;;; Copyright © 2016-2018 John Foley
;;;; All rights reserved.
;;;; Web: https://foleyloaded.io
;;;; Email: john@foleyloaded.io

;;;; This config is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU Lesser General Public License as published by
;;;; the Free Software Foundation, either version 3 of the License, or
;;;; (at your option) any later version.

;;;; This config is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU Lesser General Public License for more details.
;;;; You should have received a copy of the GNU Lesser General Public License
;;;; along with this config.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Sets up the packages config, including repos, and then requires package files and their config

;;; Code:
(require 'package) ;; You might already have this line
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))

(package-initialize)
(package-refresh-contents)

(when (not (package-installed-p 'use-package))
    (progn
      (package-install 'use-package)))
(require 'use-package)

(add-hook 'after-init-hook
          (lambda ()
            (mapc (lambda (package-file) (load package-file))
      (directory-files (concat user-emacs-directory "packages/") t "^[^\.].*\.el$"))))

(provide 'packages)
;;; packages.el ends here
