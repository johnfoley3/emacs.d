(use-package color-theme-solarized)

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))

;; Currently not working :/
(defun change-solar-light ()
    "Changes the frame to use solar light."
    (set-frame-parameter nil 'background-mode 'light))

(defun change-solar-dark ()
  "Changes the frame to use solar dark."
  (interactive)
  (set-frame-parameter nil 'background-mode 'dark))
