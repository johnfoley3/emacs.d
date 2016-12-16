;;; Projectile
(use-package projectile
  :bind (("C-w" . helm-projectile-find-file)))
(projectile-global-mode)

;;; Projectile with Rails
(use-package projectile-rails)
