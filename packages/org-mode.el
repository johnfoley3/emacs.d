;;; custom org mode configuration
(use-package org
  :bind (:map org-mode-map
              ("C-," . helm-mini)))
(require 'org)
(global-set-key (kbd "C-c c") 'org-capture)

(org-babel-do-load-languages 'org-babel-load-languages
                             '(
                               (shell . t)
                               )
                             )

(use-package org-jira)

(use-package org-brain
  :init
  (setq org-brain-path "~/org-brain")
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 20))

(defun commit-org-message ()
  (interactive)
  (let ((template "changes from %s on %s")
        (host (system-name))
        (today (format-time-string "%FT%T%z")))
    (insert (format template host today))))

(defun commit-org-notes ()
  (interactive)
  (add-hook 'git-commit-setup-hook 'commit-org-message)
  (magit-commit)
  (add-hook 'git-commit-setup-hook 'commit-org-message))
