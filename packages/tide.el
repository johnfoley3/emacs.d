(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(use-package tide
  ;; :mode ("\\.tsx\\'" . typescript-mode)
  :init
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

;; enable typescript-tslint checker
;; adds it to all web mode, and that is just stupid
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(flycheck-add-mode 'typescript-tslint 'web-mode)

(add-hook 'web-mode-hook
          (lambda ()
            (if (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode)
              (setq flycheck-disabled-checkers '(typescript-tslint)))))
