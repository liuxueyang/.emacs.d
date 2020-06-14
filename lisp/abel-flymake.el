;;; package -- Summary
;;; Commentary:
;; init

;;; Code:

;; (use-package flymake-cursor
;;   :ensure t
;;   :config (flymake-cursor-mode))

(use-package flycheck
  :delight
  :ensure t
  :init
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; (setq flycheck-check-syntax-automatically)
  ;; (setq-default flycheck-disabled-checkers '(lsp go-gofmt))
  ;; (setq-default flycheck--automatically-enabled-checkers '(go-vet))
  ;; (flycheck-select-checker 'go-vet)
  ;; (setq-default flycheck-checker 'go-vet)
  )

;; (setenv "GOPATH" "/home/abel-abel/go/")

;; (add-to-list 'load-path
;;              (concat (getenv "GOPATH")
;;                      "src/github.com/dougm/goflymake"))

;; (require 'go-flymake)
;; (require 'go-flycheck)

(provide 'abel-flymake)
;;; abel-flymake.el ends here
