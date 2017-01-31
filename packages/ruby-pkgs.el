(use-package inf-ruby
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'after-init-hook 'inf-ruby-switch-setup))

(use-package bundler)

(use-package robe
  :init
  (add-hook 'ruby-mode-hook 'robe-mode 'rspec-mode))

(use-package rspec-mode)

(use-package rbenv
  :init
  (global-rbenv-mode))

(use-package ruby-mode
  :mode ("Gemfile\\'"
         "Gemfile\\.lock\\'"
         "Guardfile\\'"
         "Rakefile\\'"
         "\\.gemspec\\'"
         "\\.rabl\\'"))

(use-package rubocop
  :init
  (add-hook 'ruby-mode-hook #'rubocop-mode))
