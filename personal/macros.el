;; Personal Macros to go here

(fset 'pandas
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("#+NAME: TBL