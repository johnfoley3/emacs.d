;;; custom org mode configuration
(use-package org)
(require 'org)

(org-babel-do-load-languages 'org-babel-load-languages
                             '(
                               (shell . t)
                               )
                             )

(use-package org-jira)
(require 'org-jira)

(defun foley-org-insert-ticket-header ()
  "Insert an org todo subheading with a link as the title."
  (interactive)
  (org-insert-todo-subheading nil) (org-insert-link))

(defun foley-insert-contact-subheading (name)
  "Insert a new org mode subheading with the NAME as the title."
  (interactive "sName: ")
  (org-insert-subheading nil) (insert name))
