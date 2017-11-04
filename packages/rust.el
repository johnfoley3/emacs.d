;;; Rust related packages

;;; rust mode for indentation, styling, syntax highlighting, etc
(use-package rust-mode)

;;; cargo minor mode to run cargo commands
(use-package cargo
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package racer
  :init
  (add-hook 'rust-mode-hook 'racer-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(use-package flymake-rust
  :init
  (add-hook 'rust-mode-hook 'flymake-rust-load))

(use-package flycheck-rust
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Org mode babel support for Rust
(use-package ob-rust)
