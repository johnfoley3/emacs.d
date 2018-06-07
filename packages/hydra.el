(use-package hydra
  :config
  (defhydra corgmonster/join-lines ()
    ("<up>" join-line)
    ("<down>" (join-line 1))
    ("t" join-line)
    ("n" (join-line 1))))
