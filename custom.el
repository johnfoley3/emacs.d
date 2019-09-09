(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments (quote ("--smart-case" "--stats")))
 '(ag-executable "ag")
 '(ag-ignore-list (quote ("intoxitrack-webclient/app/assets")))
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(async-bytecomp-package-mode t)
 '(auth-sources (quote ("~/.emacs.d/secrets/.authinfo.gpg")))
 '(comint-use-prompt-regexp nil)
 '(company-backends
   (quote
    (company-tide company-terraform company-robe company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev)))
 '(company-global-modes (quote (not inf-ruby)))
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(company-quickhelp-mode t)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "84da7b37214b4ac095a55518502dfa82633bee74f64daf6e1785322e77516f96" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(doom-modeline-mode t)
 '(fci-rule-color "#eee8d5")
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(flycheck-ruby-rubocop-executable nil)
 '(flycheck-tslint-args nil)
 '(flycheck-typescript-tslint-executable nil)
 '(global-company-mode t)
 '(global-flycheck-mode t)
 '(global-rbenv-mode t)
 '(gnus-init-file "~/.emacs.d/.gnus")
 '(gnus-permanently-visible-groups ".*INBOX.*")
 '(helm-M-x-fuzzy-match t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-dash-browser-func (quote eww-browse-url))
 '(helm-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(image-dired-external-viewer nil)
 '(inf-ruby-default-implementation "pry")
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(js2-mode-indent-ignore-first-tab t)
 '(js2-strict-trailing-comma-warning nil)
 '(magit-diff-use-overlays nil)
 '(magit-pull-or-fetch t)
 '(magit-rebase-arguments (quote ("--interactive")))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("~/projects/org-notes/inbox.org")))
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-sticky t)
 '(org-agenda-window-setup (quote other-window))
 '(org-capture-templates
   (quote
    (("w" "Daily log test 3" entry
      (file+datetree "~/projects/org-notes/days.org")
      "**** %^{description}")
     ("o" "Daily log" entry
      (file+datetree "~/projects/org-notes/days.org"))
     ("l" "Daily log" entry
      (file+olp+datetree "~/projects/org-notes/days.org")
      "")
     ("i" "GTD quick capture to inbox" entry
      (file+headline "~/projects/org-notes/inbox.org" "Inbox")
      "** TODO %^{description}" :prepend t))) t)
 '(org-clock-persist t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-log-into-drawer nil)
 '(org-src-fontify-natively t)
 '(org-startup-truncated nil)
 '(org-todo-keywords
   (quote
    ((sequence "TODO" "IN PROGRESS" "REVIEW PENDING" "REVIEW IN PROGRESS" "DONE")
     (type "PERSONAL" "WORK" "OTHER"))))
 '(org-use-last-clock-out-time-as-effective-time t)
 '(package-check-signature nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (indium doom-themes sqlformat spacemacs-theme yaml-mode helm-css-scss emmet-mode web-mode tide company-terraform terraform-mode solarized-theme smartparens toml-mode rubocop rbenv rspec-mode robe bundler ob-restclient company-restclient restclient rainbow-delimiters projectile-rails prodigy paradox mocha nodejs-repl nlinum nginx-mode multi-term markdown-mode+ markdown-mode git-link magit lua-mode key-chord yarn-mode npm-mode add-node-modules-path js2-refactor js-doc js2-mode jenkins indent-guide hydra helm-chrome helm-lobsters helm-descbinds helm-swoop helm-ag helm-company helm-projectile helm guide-key flycheck exec-path-from-shell emojify editorconfig dotenv-mode dockerfile-mode docker company-quickhelp company delight ag ace-jump-mode use-package)))
 '(paradox-github-token t)
 '(pdf-misc-print-programm "/usr/bin/gtklp")
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(projectile-completion-system (quote helm))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work")))
 '(projectile-project-root-files
   (quote
    ("rebar.config" "project.clj" "build.boot" "SConstruct" "pom.xml" "build.sbt" "gradlew" "build.gradle" ".ensime" "Gemfile" "requirements.txt" "setup.py" "tox.ini" "composer.json" "Cargo.toml" "mix.exs" "stack.yaml" "info.rkt" "DESCRIPTION" "TAGS" "GTAGS" "package.json")))
 '(rbenv-show-active-ruby-in-modeline nil)
 '(rspec-rake-command "rails")
 '(rspec-use-spring-when-possible nil)
 '(ruby-align-chained-calls t)
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
 '(ruby-deep-indent-paren-style nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(rust-format-on-save t)
 '(safe-local-variable-values
   (quote
    ((jiralib-url . "https://intoximeters.atlassian.net")
     (jiralib-url . https://intoximeters\.atlassian\.net))))
 '(sentence-end-double-space nil)
 '(sh-basic-offset 2)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sql-postgres-login-params
   (quote
    ((user :default "jfoley")
     password server
     (database :default "jfoley"))))
 '(sqlformat-command (quote pgformatter))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(typescript-indent-level 2)
 '(use-package-always-ensure t)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-auto-opening nil)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-enable-css-colorization nil)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"])
 '(yas-also-auto-indent-first-line t)
 '(yas-good-grace nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
