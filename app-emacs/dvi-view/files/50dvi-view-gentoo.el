
;; dvi-view site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'dvi-view-file "dvi-view" "View DVI-FILE in an Emacs buffer." t)
(eval-after-load "dvi-view" '(require 'cl)) ; bug fix
