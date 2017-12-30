;; Personal Macros to go here

(fset 'pandas
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("#+NAME: TBL	OA	>#+BEGIN_SRC python :preamble \"# -*- coding: utf-8 -*-\" :results raw :var tbl=TBL :colnames noimport orgtools as otdf = ot.org2df(tbl)return ot.df2org(df)#+END_SRCOAOAy" 0 "%d")) arg)))

(fset 'drill
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([67108896 67108896 3 10 up return 134217848 115 101 116 45 118 97 114 105 97 98 108 101 return 111 114 103 45 115 112 101 99 105 97 108 45 99 116 114 108 45 97 47 101 return 116 return 1 67108896 5 134217847 134217848 115 101 116 45 118 97 114 105 97 98 108 101 return 111 114 103 45 115 112 101 99 105 97 108 45 99 116 114 108 45 97 47 101 return 110 105 108 return 21 67108896 21 67108896 134217848 111 114 103 45 100 114 105 108 108 45 116 97 98 108 101 45 103 101 110 101 114 97 116 101 return 25 return return 84 114 97 110 115 108 97 116 101 32 116 104 101 32 102 111 108 108 111 119 105 110 103 32 119 111 114 100 40 115 41 return] 0 "%d")) arg)))
