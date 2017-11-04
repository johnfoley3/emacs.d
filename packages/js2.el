;;; js2 mode
(use-package js2-mode)
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist `(,(rx ".js" string-end) . js2-mode))
;; compare against this later
;; (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;;; jsdoc mode
(use-package js-doc)

;;; js2 refactor
(use-package js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-d")
