;;; js2 mode
(use-package js2-mode
  :mode ("\\.js\\'"))
;; compare against this later
;; (add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;;; jsdoc mode
(use-package js-doc)

;; (use-package prettier-js
;;   :init
;;   (add-hook 'js2-mode-hook 'prettier-js-mode)
;;   (add-hook 'web-mode-hook 'prettier-js-mode))

;;; js2 refactor
(use-package js2-refactor
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode))

(js2r-add-keybindings-with-prefix "C-c C-d")
