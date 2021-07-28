(add-to-list 'load-path "@SITELISP@")
(eval-after-load 'erc
  (load "erc-sasl-login" nil t))
