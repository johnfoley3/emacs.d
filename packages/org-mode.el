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
(add-to-list 'org-agenda-files "~/projects/org-notes/inbox.org")
(setq org-capture-templates '())
(add-to-list 'org-capture-templates '("i" "GTD quick capture to inbox" entry
                                      (file+headline "~/projects/org-notes/inbox.org" "Inbox")
                                      "** TODO %^{description}\n%?" :prepend t))
(add-to-list 'org-capture-templates '("l" "Daily Log" entry
                                      (file+datetree "~/projects/org-notes/days.org")
                                      "**** %<%H:%M> %^{description}\n%?"))

(use-package org-brain
  :init
  (setq org-brain-path "~/org-brain")
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 20))
