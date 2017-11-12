;; Use TCP not unix sockets
;;(setq server-use-tcp t)

(require 'cnfonts)
(cnfonts-enable)
(setq cnfonts-use-face-font-rescale t)
(setq cnfonts-profiles
      '("program" "org-mode" "read-book"))


;; update the list of LaTeX classes and associated header (encoding, etc.)
;; and structure
'(add-to-list 'org-latex-classes
              `("beamer"
                ,(concat "\\documentclass[presentation]{beamer}\n"
                         "[DEFAULT-PACKAGES]"
                         "[PACKAGES]"
                         "[EXTRA]\n")
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(setq org-latex-listings t)

;; zsh does not work well as an inferior shell
(setq explicit-shell-file-name "/bin/bash")
;; async-shell-command also must use bash not sh
;;(setq shell-file-name explicit-shell-file-name)

(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:username@ssh.strato.de:")
                   "remote-shell" "/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:username@ssh.strato.de:")
                   "remote-shell-login" '("-")))


(setq org-publish-project-alist
      '(("html"
         :base-directory "~/org/mandarin"
         :base-extension "org"
         :publishing-directory "/ssh:username@ssh.strato.de:~/website/"
         :publishing-function org-html-publish-to-html
         )
        ("pdf"
         :base-directory "~/org/mandarin"
         :base-extension "org"
         :publishing-directory "/ssh:username@ssh.strato.de:~/website/"
         :publishing-function org-beamer-publish-to-pdf
         )
        ("other"
         :base-directory "~/org/mandarin/"
         :base-extension "css\\|el"
         :publishing-directory "/ssh:username@ssh.strato.de:~/website/"
         :publishing-function org-publish-attachment)
        ("website" :components ("html" "pdf" "other"))))


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
