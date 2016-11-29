;;;; Credit for this goes to Christopher W. Carpenter
;;;; Web: https://mordocai.net
;;;; Email: mordocai@mordocai.net
;;; Magit
(package-install? 'magit)
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
(add-hook 'magit-mode-hook #'endless/add-PR-fetch)
(add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell)
