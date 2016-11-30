;;; js2 mode
(use-package js2-mode)
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist `(,(rx ".js" string-end) . js2-mode))
