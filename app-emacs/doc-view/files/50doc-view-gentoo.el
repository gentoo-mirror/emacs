
;; doc-view site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'doc-view "doc-view"
  "Query for a document, convert it to png and start viewing it." t)
