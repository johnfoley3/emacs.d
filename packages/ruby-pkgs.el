(use-package robe
  :init
  (add-hook 'ruby-mode-hook 'robe-mode))

(use-package ruby-end)

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
