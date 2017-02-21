(require 'erc-services)

(defun erc-connect/slack ()
  "Connect to slack ERC"
  (interactive)
  (add-to-list 'erc-networks-alist '(slack "irc.slack.com"))
  (add-to-list 'erc-nickserv-alist
               '(slack "NickServ!NickServ@services."
                       "This nickname is registered."
                       "NickServ" "IDENTIFY" nil))
  (erc-tls :server "shoreware.irc.slack.com" :port 6667
           :nick "mpenet" :password slack-connect-password)))

(global-set-key (kbd "C-c e s") 'erc-connect/slack)
