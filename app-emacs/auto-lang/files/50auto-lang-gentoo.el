
;;; auto-lang site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'auto-lang-minor-mode "auto-lang" "Toggle auto-lang minor mode." t)
(add-hook 'message-setup-hook '(lambda () (auto-lang-minor-mode t)))
(add-hook 'mail-setup-hook '(lambda () (auto-lang-minor-mode t)))
(add-hook 'text-mode-hook '(lambda () (auto-lang-minor-mode t)))
