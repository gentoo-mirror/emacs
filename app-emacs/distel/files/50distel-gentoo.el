
;;; distel site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'distel-erlang-mode-hook "distel" nil t)
(add-hook 'erlang-mode-hook 'distel-erlang-mode-hook)
