;;; package -- Summary
;;; Commentary:
;;; Code:

;; go programming language

(use-package go-mode
  :ensure t
  :config
  (setq flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled)))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred)
  :config
  (setq lsp-print-io t))

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; company-lsp integrates company mode completion with lsp-mode.
;; completion-at-point also works out of the box but doesn't support snippets.
(use-package company-lsp
  :ensure t
  :commands company-lsp)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)

  (setq lsp-gopls-staticcheck t
        lsp-eldoc-render-all t
        lsp-gopls-complete-unimported t)

  (setq lsp-ui-doc-enable nil
        lsp-ui-peek-enable t
        lsp-ui-sideline-enable t
        lsp-ui-imenu-enable t
        lsp-ui-flycheck-enable t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package go-playground
  :ensure t)

(provide 'abel-go)

;;; abel-go.el ends here
