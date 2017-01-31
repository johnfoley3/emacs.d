(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go))
  :config (setq dumb-jump-selector 'helm)
  :ensure)
