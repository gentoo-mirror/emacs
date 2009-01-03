
;;; maude-mode site-lisp configuration

(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("\\.maude\\'" . maude-mode))
(autoload 'run-maude "maude-mode"
  "Run an inferior Maude process, input and output via buffer *Maude*." t)
(autoload 'run-full-maude "maude-mode" nil t)
(autoload 'maude-mode "maude-mode" "Major mode for editing Maude files." t)
(setq maude-command "maude")
