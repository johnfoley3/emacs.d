;;; Unison file syncing
(use-package unison)

;;; Sync Org mode files to server
(defun foley-unison-sync-org ()
  "Syncs my org files with my server using Unison."
  (interactive)
  (setq unison-args "~/projects/org-notes/ ssh://john@foleyloaded.io//home/john/org-notes/")
  (unison))

;;; Unison config highlighting
(use-package unison-mode)
