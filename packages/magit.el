;; Command to list ignored files:
;; $ git ls-files --others --ignored --exclude-standard --directory
(defun magit-ignored-files ()
  (magit-git-items "ls-files" "--others" "--ignored" "--exclude-standard" "-z" "--directory"))

(defun magit-insert-ignored-files ()
  (-when-let (files (magit-ignored-files))
    (magit-insert-section (ignored)
      (magit-insert-heading "Ignored files:")
      (magit-insert-un/tracked-files-1 files nil)
      (insert ?\n))))

;;;; Credit for endless/add-PR-fetch goes to Lily Carpenter
;;;; Web: https://azrazalea.net
;;;; Email: lily@azrazalea.net
;;; Magit
(use-package magit
  :init
  (global-set-key (kbd "C-x g") 'magit-status)
  (add-hook 'magit-mode-hook #'endless/add-PR-fetch)
  (unless (windows?) (add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell))
  :hook ((magit-status-sections-hook . magit-insert-ignored-files)))

(use-package autorevert
  :delight auto-revert-mode)

(setq magit-last-seen-setup-instructions "1.4.0")
(defun endless/add-PR-fetch ()
  "If refs/pull is not defined on a GH repo, define it."
  (let ((fetch-address
         "+refs/pull/*/head:refs/pull/origin/*"))
    (unless (member
             fetch-address
             (magit-get-all "remote" "origin" "fetch"))
      (let ((remote (magit-get "remote" "origin" "url")))
        (when (and remote (string-match
                           "github" remote))
          (magit-git-string
           "config" "--add" "remote.origin.fetch"
           fetch-address))))))

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
