;;; Projectile
(use-package projectile
  :bind (("C-f" . helm-projectile-find-file)))
(projectile-global-mode)

;;; Projectile with Rails
(use-package projectile-rails)
