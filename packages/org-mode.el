;;; custom org mode configuration
(defun foley/build-jira-link (id)
  "Given a Jira ID number and optional project PREFIX, return the url of the Jira issue."
  (interactive "sJira ID: ")
  (insert (concat "https://intoximeters.atlassian.net/browse/TRACK-" id)))

(use-package org-mode
  :bind (:map org-mode-map
              ("M-i" . 'org-clock-in)
              ("M-o" . 'org-clock-out)
              ("M-J" . 'foley/build-jira-link)))
