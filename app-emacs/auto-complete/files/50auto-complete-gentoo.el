(add-to-list 'load-path "@SITELISP@")
(autoload 'auto-complete "auto-complete"
  "Start auto-completion at current point." t)
(autoload 'auto-complete-mode "auto-complete"
  "AutoComplete mode" t)
(setq ac-dictionary-directories "@SITEETC@/dict")
