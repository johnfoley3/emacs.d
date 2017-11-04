(use-package web-mode
  :init
  (add-hook 'html-mode-hook 'web-mode))

;; Must be explicit for Linux environments
(setq web-mode-enable-auto-closing t)

(use-package emmet-mode
  :init
  (add-hook 'html-mode-hook 'emmet-mode)
  :bind (:map emmet-mode-keymap
              ("C-c C-k" . emmet-expand-line)))

(use-package less-css-mode)

(use-package helm-css-scss)
