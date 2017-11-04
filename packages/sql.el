(require 'sql)
(sql-set-product-feature 'postgres :prompt-regexp "^[_[:alpha:]]*[=][#>] ")

;; Douglas La Rocca from https://www.emacswiki.org/emacs/SqlMode
(defun upcase-sql-keywords ()
  "Uppercases all SQL keywords in the buffer."
  (interactive)
  (save-excursion
    (dolist (keywords sql-mode-postgres-font-lock-keywords)
      (goto-char (point-min))
      (while (re-search-forward (car keywords) nil t)
        (goto-char (+ 1 (match-beginning 0)))
        (when (eql font-lock-keyword-face (face-at-point))
          (backward-char)
          (upcase-word 1)
          (forward-char))))))
