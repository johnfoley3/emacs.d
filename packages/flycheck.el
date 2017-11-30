;;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))

(defun foley-flycheck-command-wrapper (command)
  "Configured with Flycheck to receive a command that a checker builds and return
 the actual command to run"
  (if (string= (car command) "rubocop")
      (append '("bundle" "exec") command)))
