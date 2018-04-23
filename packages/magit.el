(require 'utilities)

(eval-when-compile
  (defvar magit-last-seen-setup-instructions))

;;; Magit
(use-package magit
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  (unless (windows?) (add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell))
  :bind (("C-x g" . magit-status))
  :hook ((magit-status-sections-hook . magit-insert-ignored-files)))

(use-package autorevert
  :delight auto-revert-mode)

(use-package git-link
  :bind
  (("C-c g l" . git-link)
   ("C-c g m" . git-link-master)))

(require 'git-link)
(require 'magit)
(defun git-link-master ()
  "Works like git-link except it forces the use of master branch instead of the default branch."
  (interactive)
  (let ((git-link-default-branch "master"))
    (call-interactively 'git-link)))
