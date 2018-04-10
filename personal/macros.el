;; Personal Macros to go here

;; This isn't a macro but defines original M-x (hijacked by smex)
;; as C-x M-x so that it can still be used to edit saved keyboard
;; macros using C-x C-k e C-x M-x <macro name>
;;
;; This is created by running
;; M-x global-set-key C-x M-x RET execute-extended-command RET
;; And immediately afterwards
;; C-x ESC ESC C-a C-k C-g
;; And then yank it from the kill ring with C-y
(global-set-key [24 134217848] (quote execute-extended-command))

;; This also isn't a macro - it's a hack required until emacs27
;; to allow you to insert an edited, named, keyboard macro
;; https://emacs.stackexchange.com/questions/37065/editing-a-stored-keyboard-macro-and-storing-the-edited-version
(defun my-kmacro-hack (&rest _)
  (interactive
   (list (intern (completing-read
                  "Insert kbd macro (name): "
                  obarray
                  (lambda (elt)
                    (and (fboundp elt)
                         (or (stringp (symbol-function elt))
                             (vectorp (symbol-function elt))
                             (kmacro-extract-lambda (symbol-function elt)))))
                  t))
         current-prefix-arg))
  nil)
(advice-add 'insert-kbd-macro :before #'my-kmacro-hack)


;; Now for my Macros!

(fset 'pandas
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("#+NAME: TBL	OA	>#+BEGIN_SRC python :preamble \"# -*- coding: utf-8 -*-\" :results raw :var tbl=TBL :colnames noimport orgtools as otdf = ot.org2df(tbl)return ot.df2org(df)#+END_SRCOAOAy" 0 "%d")) arg)))

(fset 'drill
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108896 67108896 3 10 up return 134217848 115 101 116 45 118 97 114 105 97 98 108 101 return 111 114 103 45 115 112 101 99 105 97 108 45 99 116 114 108 45 97 47 101 return 116 return 1 67108896 5 134217847 134217848 115 101 116 45 118 97 114 105 97 98 108 101 return 111 114 103 45 115 112 101 99 105 97 108 45 99 116 114 108 45 97 47 101 return 110 105 108 return 21 67108896 21 67108896 134217848 111 114 103 45 100 114 105 108 108 45 116 97 98 108 101 45 103 101 110 101 114 97 116 101 return 25 return return 84 114 97 110 115 108 97 116 101 32 116 104 101 32 102 111 108 108 111 119 105 110 103 32 119 111 114 100 40 115 41 return] 0 "%d")) arg)))

(fset 'link-chinese
   [?\C-  ?\C-  C-up tab tab tab ?\C-  ?\M-e ?\M-w tab M-S-right ?\C-y ?\C-c ?\C-c down down ?= ?\' ?\( ?c ?o ?n ?c ?a ?t ?  ?\" ?\[ ?\[ ?h ?t ?t ?p ?s ?: ?/ ?/ ?t ?r ?a ?n ?s ?l ?a ?t ?e ?. ?g ?o ?o ?g ?l ?e ?. ?c ?o ?m ?/ ?# ?z ?h ?- ?c ?n ?/ ?e ?n ?/ ?\" ?  ?$ ?3 ?  ?\" ?\] ?\[ ?\" ?  ?$ ?3 ?  ?\" ?\] ?\] ?\" ?\) return ?\C-u ?\C-c ?\C-c S-iso-lefttab ?\C-c ?\C-c M-S-left C-down up ?\C-k ?\C-k up ?\C-u ?\C-  ?\C-u ?\C-  ?\C-u ?\C- ])

(fset 'chinese-to-scratch
   [C-up tab tab tab tab M-S-right down down ?= ?\' ?\( ?l ?e ?t ?  ?\( ?\( ?s ?t ?r ?  ?$ ?3 ?\) ?\) ?  ?\( ?s ?t ?r ?i ?n ?g ?- ?m ?a ?t ?c ?h ?  ?o ?r ?g ?- ?b ?r ?a ?c ?k ?e ?t ?- ?l ?i ?n ?k ?- ?r ?e ?g ?e ?x ?p ?  ?s ?t ?r ?\) ?  ?\( ?o ?r ?  ?\( ?m ?a ?t ?c ?h ?- ?s ?t ?r ?i ?n ?g ?  ?3 ?  ?s ?t ?r ?\) ?  ?\( ?m ?a ?t ?c ?h ?- ?s ?t ?r ?i ?n ?g ?  ?1 ?  ?s ?t ?r ?\) ?\) ?\) ?\C-u ?\C-c ?\C-c C-down up ?\C-a ?\C-k ?\C-k up tab tab tab tab tab ?\C-c ?\C-c left left left ?\C-x ?  C-up down down tab tab tab tab ?\M-w M-S-left ?\C-x ?b ?* ?s ?c ?r ?a ?t ?c ?h ?* return ?\M-> return ?\C-y return])
