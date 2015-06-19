(add-to-list 'load-path "@SITELISP@")

(autoload 'erc-bbdb-mode "erc-bbdb")
(autoload 'erc-cmd-CHESS "erc-chess")
(autoload 'erc-chess-ctcp-query-handler "erc-chess")
(autoload 'erc-list-old-mode "erc-list-old")
(autoload 'erc-list-channels "erc-list-old"
  "Display a buffer containing a list of channels on the current server." t)
(autoload 'erc-chanlist "erc-list-old"
  "Show a channel listing of the current server in a special mode." t)

(setq erc-nicklist-icons-directory "@SITEETC@/images/")
