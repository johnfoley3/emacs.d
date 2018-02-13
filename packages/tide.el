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

;; use web-mode for .tsx
;; enable typescript-tslint checker only for tsx files
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(flycheck-add-mode 'typescript-tslint 'web-mode)

(add-hook 'web-mode-hook
          (lambda ()
            (if (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode)
              (setq flycheck-disabled-checkers '(typescript-tslint)))))

(defun toggle-arrow-function ()
  (interactive)
  (insert "{") (newline-and-indent) (insert "return ")
  (end-of-line) (backward-char) (insert ";")
  (newline) (insert "}") (indent-according-to-mode))
