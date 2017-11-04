;;; Terraform major mode and company backend
(use-package terraform-mode)
(use-package company-terraform
  :init (company-terraform-init))
