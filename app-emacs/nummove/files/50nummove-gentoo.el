
;;; nummove site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(autoload 'nummove "nummove" nil t)
(setq nummove-path-to-images "@SITEETC@/")
