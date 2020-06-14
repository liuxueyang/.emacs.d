;;; package --- Summary
;;; Commentary:

;;; Code:

;; for shells

(setq explicit-shell-file-name
      "/bin/bash")

(global-set-key [f12] 'eshell)

(require 'em-smart)

;; set PATH for eshell
;; https://github.com/emacs-china/hello-emacs/blob/master/Emacs%E4%B8%AD%E7%9A%84shell--Eshell%E4%BD%BF%E7%94%A8%E7%AC%94%E8%AE%B0.org
(eshell/addpath "$HOME/.cargo/bin")

(provide 'abel-shell)
;;; abel-shell.el ends here
