;;; js2 mode
(use-package js2-mode
  :mode ("\\.js\\'"))
;; compare against this later
;; (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;;; jsdoc mode
(use-package js-doc)

;;; js2 refactor
(use-package js2-refactor
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode))

;;; Add node_modules/.bin to path
(use-package add-node-modules-path
  :hook ((typescript-mode js2-mode web-mode) . add-node-modules-path))
(setq add-node-modules-path-debug t)

(js2r-add-keybindings-with-prefix "C-c C-d")

(use-package npm-mode)
(use-package yarn-mode)
