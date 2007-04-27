
;; edb site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(let ((el "database") (blurb "Emacs Database"))
  (autoload 'edb-EXPERIMENTAL-interact el blurb t)
  (autoload 'db-find-file el blurb t))
