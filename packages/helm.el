(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("M-y" . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files)))
(use-package helm-projectile)
(use-package helm-company)
(use-package helm-ag)
