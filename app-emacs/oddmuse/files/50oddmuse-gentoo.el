
;; oddmuse site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'oddmuse-toggle-minor "oddmuse" "Toggle minor mode state." t)
(autoload 'oddmuse-edit "oddmuse" "Edit a page on a wiki." t)
(autoload 'oddmuse-follow "oddmuse"
  "Figure out what page we need to visit
and call `oddmuse-edit' on it." t)
(autoload 'oddmuse-post "oddmuse"
  "Post the current buffer to the current wiki.
The current wiki is taken from `oddmuse-wiki'." t)
(autoload 'oddmuse-revert "oddmuse" "Revert this oddmuse page." t)
(autoload 'oddmuse-insert-pagename "oddmuse"
  "Insert a PAGENAME of current wiki with completion." t)
(autoload 'emacswiki-post "oddmuse"
  "Post the current buffer to the EmacsWiki.
This command is intended to post current EmacsLisp program easily." t)
