(use-package hydra)

(defvar whitespace-mode nil)
(global-set-key
 (kbd "C-c .")
 (defhydra hydra-toggle-simple (:color blue)
   "toggle"
   ("a" abbrev-mode "abbrev")
   ("d" toggle-debug-on-error "debug")
   ("f" auto-fill-mode "fill")
   ("t" toggle-truncate-lines "truncate")
   ("w" whitespace-mode "whitespace")
   ("q" nil "cancel")))
