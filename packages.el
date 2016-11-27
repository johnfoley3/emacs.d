;;;; Copyright © 2016 John Foley
;;;; All rights reserved.
;;;; Web: https://foleyloaded.io
;;;; Email: johnfoley3@gmail.com

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

;; Load all files in packages directory
(package-initialize)
(package-install? 'use-package)
(mapc (lambda (package-file) (load package-file))
      (directory-files "~/.emacs.d/packages/" t "^[^\.].*\.el$"))
