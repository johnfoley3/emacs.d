(use-package prodigy)

(prodigy-define-tag
  :name 'intox-foreman
  :ready-message "Listening on localhost:[0-9]+, CTRL\\+C to stop")

(prodigy-define-service
  :name "intoxitrack foreman"
  :command "bundle"
  :args '("exec" "foreman" "start")
  :cwd "/home/john/projects/intoxitrack-service"
  :tags '(intox-foreman))
