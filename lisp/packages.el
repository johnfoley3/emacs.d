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
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq load-prefer-newer t)

(add-hook 'after-init-hook
          (lambda ()
            (mapc (lambda (package-file) (load package-file))
      (directory-files (concat user-emacs-directory "packages/") t "^[^\.].*\.el$"))))

(provide 'packages)
;;; packages.el ends here
