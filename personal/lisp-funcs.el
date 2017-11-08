;; Personal Lisp Function to go here

(defun tabulate-csv (filename)
  (interactive "fCSV Filename: ")
  (switch-to-buffer "csv-table")
  (org-mode)
  (end-of-buffer)
  (newline)
  (org-table-import filename nil)
  (org-ctrl-c-minus)
  (org-table-toggle-coordinate-overlays)
  )
