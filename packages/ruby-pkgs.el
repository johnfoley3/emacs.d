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
         "\\.rabl\\'")
  :hook ((ruby-mode . hs-minor-mode)))

(defun setup-ruby-hideshow ()
  "Set up Ruby hideshow block delimiters"
  (eval-after-load "hideshow"
    '(add-to-list 'hs-special-modes-alist
                  `(ruby-mode
                    ,(rx (or "def" "class" "module" "do" "{" "["))
                    ,(rx (or "}" "]" "end"))
                    ,(rx (or "#" "=begin"))
                    ruby-forward-sexp nil))))

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
  :hook ((ruby-mode . inf-ruby-minor-mode)
         (after-init . inf-ruby-switch-setup)))

(use-package bundler)
(use-package robe
  :hook (ruby-mode . robe-mode))

(use-package rspec-mode
  :hook ( ruby-mode-hook . rspec-mode)
  :bind (:map rspec-mode-map
              ("C-c , S" . foley-rspec-verify-single-debug)
              ("C-c , V" . foley-rspec-verify-debug)))

(use-package rbenv
  :init
  (global-rbenv-mode))


(use-package rubocop
  :hook (ruby-mode . rubocop-mode))
