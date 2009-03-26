(add-to-list 'load-path "@SITELISP@")
(require 'jde-autoload)

(setq jde-java-directory "/usr/share/jde")
(setq jde-bsh-jar-file "@BSH_JAR@")
(setq jde-checkstyle-jar-file "@CHECKSTYLE_JAR@")
;;(setq jde-regexp-jar-file
;;      "/usr/share/jakarta-regexp-1.4/lib/jakarta-regexp.jar")
(setq jde-checkstyle-style "/usr/share/checkstyle/checks/sun_checks.xml")
(setq jde-html-directory "/usr/share/doc/@PF@/html")
(setq bsh-html-directory "/usr/share/doc/@PF@/html")
