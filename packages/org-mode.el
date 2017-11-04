;;; custom org mode configuration
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\M-i" 'org-clock-in)
            (local-set-key "\M-o" 'org-clock-out)))
