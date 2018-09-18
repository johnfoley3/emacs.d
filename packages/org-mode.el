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
