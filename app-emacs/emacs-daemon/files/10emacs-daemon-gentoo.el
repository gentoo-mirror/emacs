
;;; emacs-daemon site-lisp configuration

(and
 (fboundp 'daemonp)
 (daemonp)
 (let ((file (concat "/var/run/emacs-daemon/"
		     (user-login-name) "/emacs.pid")))
   (if (file-writable-p file)
       ;; write process id to file
       (with-temp-file file
	 (insert (number-to-string (emacs-pid)) "\n")))))
