;;; major mode
;; https://github.com/elixir-editors/emacs-elixir
(use-package elixir-mode)

;;; tool integration
;; https://github.com/tonini/alchemist.el
(use-package alchemist)


;;; flycheck integration
;; https://github.com/tomekowal/flycheck-mix
(use-package flycheck-mix)

;;; org babel integration
;; https://github.com/zweifisch/ob-elixir
(use-package ob-elixir)

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(add-hook 'elixir-format-hook (lambda ()
                                 (if (projectile-project-p)
                                      (setq elixir-format-arguments
                                            (list "--dot-formatter"
                                                  (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
                                   (setq elixir-format-arguments nil))))
