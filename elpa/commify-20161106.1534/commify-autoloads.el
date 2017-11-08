;;; commify-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "commify" "commify.el" (23043 3608 540370 433000))
;;; Generated autoloads from commify.el

(autoload 'commify-toggle-at-point "commify" "\
Toggle insertion or deletion of grouping characters in the number around point.

\(fn)" t nil)

(autoload 'commify-toggle-on-region "commify" "\
Toggle insertion or deletion of numeric grouping characters.
Do so for all numbers in the region between BEG and END.

\(fn BEG END)" t nil)

(autoload 'commify-toggle "commify" "\
Toggle commas at point or on the region from BEG to END.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; commify-autoloads.el ends here
