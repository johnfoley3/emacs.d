;;; custom org mode configuration
(use-package org
  :bind (:map org-mode-map
              ("C-," . helm-mini)))
(require 'org)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

(org-babel-do-load-languages 'org-babel-load-languages
                             '(
                               (shell . t)
                               )
                             )
(add-to-list 'org-agenda-files "~/projects/org-notes/inbox.org")
(add-to-list 'org-agenda-files "~/projects/org-notes/projects.org")
(add-to-list 'org-agenda-files "~/projects/org-notes/work.org")
(setq org-capture-templates '())
(add-to-list 'org-capture-templates '("i" "GTD quick capture to inbox" entry
                                      (file+headline "~/projects/org-notes/inbox.org" "Inbox")
                                      "** TODO %^{description}\n%?" :prepend t))
(add-to-list 'org-capture-templates '("l" "Daily Log" entry
                                      (file+datetree "~/projects/org-notes/days.org")
                                      "**** %<%H:%M> %^{description}\n%?"))

(setq org-refile-targets '((org-agenda-files . (:maxlevel . 3))))
;; Tell org not to use the default step by step approach to narrowing refile headers,
;; since helm is used to narrow results
(setq org-outline-path-complete-in-steps nil)

;; Could be useful if I end up refiling lots of new things with a structure
;; in mind, but doesn't exist yet. The current approach would be to create that
;; structure before refiling the target (even if it means aborting a refiling)
;; (setq org-refile-allow-creating-parent-nodes 'confirm)

;;; Thank you Sacha Chua
;;; source http://pages.sachachua.com/.emacs.d/Sacha.html
(defun my/org-use-speed-commands-for-headings-and-lists ()
  "Activate speed commands on list items too."
  (or (and (looking-at org-outline-regexp) (looking-back "^\**"))
      (save-excursion (and (looking-at (org-item-re)) (looking-back "^[ \t]*")))))
(setq org-use-speed-commands 'my/org-use-speed-commands-for-headings-and-lists)

(add-to-list 'org-speed-commands-user '("N" org-narrow-to-subtree))
(add-to-list 'org-speed-commands-user '("W" widen))
(add-to-list 'org-speed-commands-user '("i" call-interactively 'org-clock-in))
(add-to-list 'org-speed-commands-user '("o" call-interactively 'org-clock-out))
(add-to-list 'org-speed-commands-user '("$" call-interactively 'org-archive-subtree))
