;; Personal Macros to go here

(fset 'pandas
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("#+NAME: TBL	OA	>#+BEGIN_SRC python :preamble \"# -*- coding: utf-8 -*-\" :results raw :var tbl=TBL :colnames noimport orgtools as otdf = ot.org2df(tbl)return ot.df2org(df)#+END_SRCOAOAy" 0 "%d")) arg)))
