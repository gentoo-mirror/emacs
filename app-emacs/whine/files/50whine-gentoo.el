
;; whine site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'whinify "whine"
  "Make certain global-mode keys whine.  The command `unwhinify' makes
them normal again." t)
(autoload 'unwhinify "whine"
  "Hopefully, remove the whine-bindings on the whiny keys." t)
