(add-to-list 'load-path "@SITELISP@")
(autoload 'w3m-type-ahead-mode "w3m-type-ahead" nil t)
(add-hook 'w3m-mode-hook 'w3m-type-ahead-mode)
