;;; hledger mode
;;; https://github.com/narendraj9/hledger-mode
(use-package hledger-mode
  :mode ("\\.journal\\'" "\\.hledger\\'")
  :init
  (setq hledger-jfile (expand-file-name "~/projects/hledger-personal-finance/personal-finance.journal")))
