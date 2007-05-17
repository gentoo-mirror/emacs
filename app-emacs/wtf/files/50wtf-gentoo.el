
;; wtf site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'wtf-add "wtf"
  "Add ACRONYM and its DEFINITION to the list of custom associations." t)
(autoload 'wtf-remove "wtf"
  "Remove ACRONYM from the list of custom associations." t)
(autoload 'wtf-is "wtf" "Provide the definition for ACRONYM." t)
