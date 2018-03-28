;; Disables flycheck checkdoc checker for config files in this directory
;; Assumes that no real modules will exist in this directory
((emacs-lisp-mode . ((flycheck-disabled-checkers . (emacs-lisp-checkdoc)))))
