(use-package nginx-mode
  :init
  (add-to-list 'auto-mode-alist '("/nginx-conf/*.conf" . nginx-mode)))
