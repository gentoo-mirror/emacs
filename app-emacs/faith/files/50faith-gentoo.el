
;;; faith site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'faith-insert "faith"
  "Insert a quote right here, right now, in the current buffer" t)
(autoload 'faith "faith"
  "Switch to buffer *faith* and insert faith-snippets there." t)
(autoload 'faith-quote "faith"
  "Helps reinforce and spread faith in the ONE TRUE EDITOR." t)
(autoload 'faith-correct-buffer "faith"
  "Replace false Gods by the ONE TRUE GOD." t)
(autoload 'faith-correct-region "faith"
  "Replace false Gods by the ONE TRUE GOD in region delimited by B and E." t)
(autoload 'faith-correct-string "faith"
  "Replace false Gods by the ONE TRUE GOD." t)
