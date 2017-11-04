;; Yasnippet
(use-package yasnippet
  :diminish yasnippet
  :init
  (add-to-list 'load-path
               "~/.emacs.d/plugins/yasnippet")
  (yas-global-mode 1))
