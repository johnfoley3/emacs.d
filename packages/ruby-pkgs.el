(use-package robe
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'robe-mode))

(use-package rbenv
  :ensure t
  :init
  (global-rbenv-mode))

(use-package ruby-mode
  :ensure t
  :mode ("Gemfile\\'"
         "Gemfile\\.lock\\'"
         "Guardfile\\'"
         "Rakefile\\'"
         "\\.gemspec\\'"
         "\\.rabl\\'"))

(use-package rubocop
  :ensure t
  :init
  (add-hook 'ruby-mode-hook #'rubocop-mode))
