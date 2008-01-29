
;;; snippet site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'snippet-insert "snippet"
  "Insert a snippet into the current buffer at point." t)
(autoload 'snippet-abbrev "snippet"
  "Establish an abbrev for a snippet template." nil 'macro)
(autoload 'snippet-with-abbrev-table "snippet"
  "Establish a set of abbrevs for snippet templates." nil 'macro)
