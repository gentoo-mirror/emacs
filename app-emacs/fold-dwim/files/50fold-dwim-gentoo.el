
;; fold-dwim site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'fold-dwim-hide-all "fold-dwim"
  "Hide all folds of various kinds in the buffer or region" t)
(autoload 'fold-dwim-show-all "fold-dwim"
  "Show all folds of various kinds in the buffer or region" t)
(autoload 'fold-dwim-toggle "fold-dwim"
  "Try fold-dwim-show to show any hidden text at point; if no
hidden fold is found, try fold-dwim-hide to hide the construction
at the cursor." t)
