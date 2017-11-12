(use-package mu4e-alert
  :ensure t
  :after mu4e
  :init
  (setq mu4e-alert-interesting-mail-query
        "flag:unread maildir:/My-Mailbox/INBOX"
  )
  (mu4e-alert-enable-mode-line-display)
  (run-with-timer 0 60 'mu4e-alert-enable-mode-line-display)
)

(require 'mu4e)
(require 'smtpmail)

(setq user-mail-address "user@server.co.uk"
 mu4e-reply-to-address "user@server.co.uk"
 user-full-name  "User"
 )

;; enable inline images
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'ssl
      smtpmail-default-smtp-server "smtp.strato.com"
      smtpmail-smtp-server "smtp.strato.com"
      smtpmail-smtp-service 465)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)


 
