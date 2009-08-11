(add-to-list 'load-path "@SITELISP@")
(autoload 'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?\\'" . espresso-mode))
