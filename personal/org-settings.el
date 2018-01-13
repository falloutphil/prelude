(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sql . t)
   (python . t)
   ))

;; Org mode window movement works when not focused on
;; structure that redefines keys
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(require 'org-drill)

(require 'org-jira)
(setq jiralib-url "https://quantile.atlassian.net")
;; Prelude/Projectile interfere with org-jiras keys (C-c i etc) with imenu
(add-hook 'org-jira-mode-hook '(lambda() (setq prelude-mode nil)))
;; Global replacement for C-c ig that works in Prelude
(key-chord-define-global "qq" 'org-jira-get-issues)
