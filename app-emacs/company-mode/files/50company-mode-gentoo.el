
;;; company-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'company-mode "company-mode" nil t)
(autoload 'company-install-bundled-completions-rules
  "company-bundled-completions")

(eval-after-load "company-mode"
  '(company-install-bundled-completions-rules))
