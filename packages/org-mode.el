;;; custom org mode configuration

(defun foley/build-jira-link (id)
  "Given a Jira ID number and optional project PREFIX, return the url of the Jira issue."
  (interactive "sJira ID: ")
  (insert (concat "https://intoximeters.atlassian.net/browse/TRACK-" id)))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\M-i" 'org-clock-in)
            (local-set-key "\M-o" 'org-clock-out)
            (local-set-key "\M-J" 'foley/build-jira-link)))
