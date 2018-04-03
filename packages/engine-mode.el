(use-package engine-mode
  :config
  (progn
    (defengine google "http://google.com/search?q=%s" :keybinding "g")
    (defengine melpa "https://melpa.org/#/?q=%s" :keybinding "m")
    (engine-mode)))
