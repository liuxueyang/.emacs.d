;;; package -- Summary
;;; Commentary:
;; init

;;; Code:

;; set user-emacs-directory variable in custom-file
;; eg.
;; (setq user-emacs-directory
;;       "~/Documents/Emacs/")

;; TODO:
;; (unless (file-readable-p "~/.emacs-custom.el")
;;   (copy-file ))
(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(add-to-list
 'load-path
 (expand-file-name (concat user-emacs-directory
			   "lisp/")))

(setq use-package-always-ensure t)

;; 各个文件之间的依赖关系
;; 排序以下语句
(require 'abel-package)

(require 'abel-builtin)

(require 'abel-util)

;; Git
(require 'abel-vc)

;; theme
(require 'abel-theme)

;; system specific
(require 'abel-system)

;; Window setting
(require 'abel-window)
(require 'abel-calendar)
(require 'abel-frame)

(require 'abel-minor)

(require 'abel-modeline)
(require 'abel-org)
(require 'abel-shell)
(require 'abel-whitespace)
(require 'abel-erc)

(require 'abel-flymake)
(require 'abel-completion)

(require 'abel-lang)

(require 'thanks-blog)
(require 'simple-blog)

;;; init.el ends here
