(use-package slack
  :commands (start-slack)
  :init
  (setq slack-buffer-emoji t)
  (setq slack-prefer-current-team t)
  :config
  (slack-register-team
   :name "johnkelsie"
   :default t
   :client-id "15854104468.143033293618"
   :client-secret "5efe87dcc6fb47f50a52a297880752ec"
   :token "xoxp-15854104468-15856814339-142399868368-4913cdc03fadbb11f00fe702c8a35654"
   :subscribed-channels '(general))
  (slack-register-team
  :name "arrayslicedeeznutz"
  :client-id "40085980663.143199997556"
  :client-secret "6b31f38b3394e123b25c2f606866a6da"
  :token "xoxp-40085980663-107356052756-143210764405-aea7661a1d41f44f41a1f8dbe3e1e4eb"
  :subscribed-channels '(da-boiz)))

(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))
