
;; cldoc site-lisp configuration

(add-to-list 'load-path "@SITELISP@")

(autoload 'turn-on-cldoc-mode "cldoc" nil t)
(add-hook 'lisp-mode-hook 'turn-on-cldoc-mode)

;; ilisp users
(add-hook 'ilisp-mode-hook 'turn-on-cldoc-mode)
(setq ilisp-bindings-*bind-space-p* nil)

;; slime users
(add-hook 'slime-repl-mode-hook
          #'(lambda ()
              (turn-on-cldoc-mode)
              (define-key slime-repl-mode-map " " nil)))
(add-hook 'slime-mode-hook
          #'(lambda () (define-key slime-mode-map " " nil)))
(setq slime-use-autodoc-mode nil)
