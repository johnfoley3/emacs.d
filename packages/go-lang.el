(use-package go-mode)
(use-package company-go)

;; Requires `gore' to be installed
;; `go get -u github.com/motemen/gore'
(use-package gorepl-mode
  :hook (go-mode . gorepl-mode))

(use-package gotest)
