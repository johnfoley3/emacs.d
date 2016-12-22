(use-package hydra)

(defvar whitespace-mode nil)

(defhydra hydra-toggle-simple (:color red)
   "toggle"
   ("a" abbrev-mode "abbrev")
   ("d" toggle-debug-on-error "debug")
   ("f" auto-fill-mode "fill")
   ("t" toggle-truncate-lines "truncate")
   ("w" whitespace-mode "whitespace")
   ("l" global-nlinum-mode "line numbers")
   ("r" rainbow-delimiters-mode "rainbow delimiters")
   ("q" nil "cancel"))

(global-set-key
 (kbd "C-c .") 'hydra-toggle-simple/body)

(defun hydra-vi/pre ()
  (set-cursor-color "#e52b50"))

(defun hydra-vi/post ()
  (set-cursor-color "#000000"))

(global-set-key
 (kbd "C-z")
 (defhydra hydra-vi (:pre hydra-vi/pre :post hydra-vi/post :color green)
   "vi"
   ("l" forward-char)
   ("h" backward-char)
   ("j" next-line)
   ("k" previous-line)
   ("m" set-mark-command "mark")
   ("a" move-beginning-of-line "beg")
   ("e" move-end-of-line "end")
   ("d" delete-region "del" :color blue)
   ("y" kill-ring-save "yank" :color blue)
   ("q" nil "quit")))
(hydra-set-property 'hydra-vi :verbosity 1)

;;* Helpers
(require 'windmove)

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

(defhydra hydra-windmove-home-row (:color red)
  "Move around the buffers"
  ("j" hydra-move-splitter-down)
  ("k" hydra-move-splitter-up)
  ("h" hydra-move-splitter-left)
  ("l" hydra-move-splitter-right))

(global-set-key
 (kbd "C-c ,") 'hydra-windmove-home-row/body)

(defhydra hydra-helm-move (:color red)
  "Move around in the Helm buffer easier"
  ("n" helm-next-line)
  ("p" helm-previous-line))

(define-key helm-projectile-find-file-map "C-." 'hydra-helm-move/body)
