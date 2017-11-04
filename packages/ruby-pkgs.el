;;; Ruby packages

;; For flycheck rubocop to work with the bundler version, create a script somewhere
;; that flycheck can execute and custom config the executable to use that script
;; #!/bin/sh
;; bundle exec rubocop

(use-package ruby-mode
  :mode ("Gemfile\\'"
         "Gemfile\\.lock\\'"
         "Guardfile\\'"
         "Rakefile\\'"
         "\\.gemspec\\'"
         "\\.rabl\\'"))

(defun go-to-compilation-window ()
  "Find and go to the first inf-ruby-compilation buffer."
  (interactive)
  (switch-to-buffer-other-frame "*rspec-compilation*"))

(defun foley-rspec-verify-single-debug ()
  "Do 'rspec-verify-single and move to compilation window for editing."
  (interactive)
  (rspec-verify-single)
  (go-to-compilation-window)
  (inf-ruby-switch-from-compilation)
  (end-of-buffer))

(defun foley-rspec-verify-debug ()
  "Do 'rspec-verify but will also move to compilation window for editing."
  (interactive)
  (rspec-verify)
  (go-to-compilation-window)
  (inf-ruby-switch-from-compilation)
  (end-of-buffer))

(use-package inf-ruby
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'after-init-hook 'inf-ruby-switch-setup))

(use-package bundler)
(use-package robe
  :init
  (add-hook 'ruby-mode-hook 'robe-mode))

(use-package rspec-mode
  :init
  (add-hook 'ruby-mode-hook 'rspec-mode)
  :bind (:map rspec-mode-map
              ("C-c , S" . foley-rspec-verify-single-debug)
              ("C-c , V" . foley-rspec-verify-debug)))

(use-package rbenv
  :init
  (global-rbenv-mode))

(use-package rubocop
  :init
  (add-hook 'ruby-mode-hook #'rubocop-mode))
