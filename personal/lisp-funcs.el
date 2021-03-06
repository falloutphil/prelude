;; Personal Lisp Function to go here

(require 'org)
(require 'org-table)

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

(defun org-table-mark-field ()
  "Mark the current table field."
  (interactive)
  ;; Do not try to jump to the beginning of field if the point is already there
  (when (not (looking-back "|\\s-?"))
    (org-table-beginning-of-field 1))
  (set-mark-command nil)
  (org-table-end-of-field 1))

;; Mark shortcut when in a table
(bind-keys
 :map org-mode-map
 :filter (org-at-table-p)
 ("S-SPC" . org-table-mark-field))


(defun get-description-from-link (str)
  "Get description from bracket link in STR."
  (string-match org-bracket-link-regexp str) (or (match-string 3 str) (match-string 1 str)))
