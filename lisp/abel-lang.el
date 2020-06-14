;;; package -- Summary
;;; Commentary:
;; settings for different languages
;;; Code:

;; associate file suffix with some language mode

;; (autoload 'php-mode "php-mode"
;;   "PHP editing mode." t)
;; (setq auto-mode-alist
;;       (cons '("\\.php$" . php-mode)
;; 	    auto-mode-alist))

(require 'abel-python)
(require 'abel-c)
(require 'abel-cpp)
(require 'abel-go)
(require 'abel-java)
(require 'abel-thrift)
(require 'abel-latex)
(require 'abel-lisp)
(require 'abel-markdown)
(require 'abel-rakudo)
(require 'abel-rust)

;; conf scripts
(require 'abel-conf)

(provide 'abel-lang)
;;; abel-lang.el ends here
