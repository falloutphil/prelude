;; Use TCP not unix sockets
                                        ;(setq server-use-tcp t)

;; zsh does not work well as an inferior shell
(setq explicit-shell-file-name "/bin/bash")
;; async-shell-command also must use bash not sh
;;(setq shell-file-name explicit-shell-file-name)

(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/su:quantile@localhost:")
                   "remote-shell" "/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/su:quantile@loclhost:")
                   "remote-shell-login" '("-")))

;; Spawned non-interactive shells still to run bashrc
(setenv "BASH_ENV" "$HOME/.bashrc")

;; Prevent result wrap on long SQL results
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))


;; Save and load window layout on restart
;;(desktop-save-mode 1)

;; Workgroups for layout management
(workgroups-mode 1)

;; Key-chord to add commas to numbers
(key-chord-define-global ",," 'commify-toggle)
