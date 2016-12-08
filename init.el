(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(load "~/.emacs.d/utilities.el")
(setq use-package-always-ensure t)
;; Move like the wind, bullseye
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(when (darwin?)
  (setenv "PATH"
         (concat (getenv "PATH")
                ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin"))))
(add-hook 'after-init-hook (lambda ()
                             (require 'use-package)
                             (load-theme 'solarized-light t)
                             (load "~/.emacs.d/packages.el")))

;; From http://stackoverflow.com/a/7250027/693712
(defun smart-line-beginning ()
  "Move point to the beginning of text on the current line; if that is already
the current position of point, then move it to the beginning of the line."
  (interactive)
  (let ((pt (point)))
    (beginning-of-line-text)
    (when (eq pt (point))
      (beginning-of-line))))
(add-hook 'prog-mode-hook (lambda () (local-set-key (kbd "C-a") 'smart-line-beginning)))

;;; Whitespace mode
(setq-default indent-tabs-mode nil)
(require 'whitespace)
(global-whitespace-mode 0)
(mapc (lambda (mode-hook)
        (add-hook mode-hook 'whitespace-mode))
      '(c-mode-hook
        js-mode-hook
        c++-mode-hook
        emacs-lisp-mode-hook
        lisp-mode-hook
        python-mode-hook
        ruby-mode-hook))
(define-key global-map (kbd "RET") 'newline-and-indent)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (js2-mode nlinum-relative nlinum ag neotree magit projectile-rails rubocop rbenv company-quickhelp use-package company helm-projectile org-projectile projectile projectile-codesearch projectile-direnv projectile-git-autofetch robe tide solarized-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
