(defun helm-knife-get-lines ()
  "Runs `knife status' and returns the list of lines from the process."
  (with-temp-buffer
    (unless (zerop (call-process "knife" nil t nil "status"))
      (error "failed to call `knife status'"))
    (split-string (buffer-substring-no-properties (point-min) (point-max)) "\n" t)))

(defun helm-knife-get-node-name (line)
  "Pulls out the name of the node from LINE."
  (nth 1 (split-string line "[,]" t " ")))

(defun helm-knife-init ()
  "Runs `knife status' to gather node information."
  (mapcar 'helm-knife-get-node-name (helm-knife-get-lines)))

(defun helm-knife-ssh (candidate)
  "SSHs to the given CANDIDATE node."
  (ssh (concat candidate ".intoxitrack.net")))

(defun helm-knife ()
  "Retrieves nodes via knife status."
  (interactive)
  (helm :sources (helm-build-sync-source "knife nodes"
                   :candidates (helm-knife-init)
                   :action 'helm-knife-ssh)
        :buffer "*knife-nodes*"))
