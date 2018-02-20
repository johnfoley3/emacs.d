;;; custom org mode configuration
(defun foley/build-jira-link (id)
  "Given a Jira ID number and optional project PREFIX, return the url of the Jira issue."
  (interactive "sJira ID: ")
  (insert (concat "https://intoximeters.atlassian.net/browse/TRACK-" id)))

(use-package org)

(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
    )
)
