(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))

;;; prettier integration
;;; https://prettier.io/
(use-package prettier-js)

(add-hook 'web-mode-hook #'(lambda ()
                             (enable-minor-mode
                              '("\\.tsx?\\'" . prettier-js-mode))))

(add-hook 'typescript-mode-hook 'prettier-js-mode)
