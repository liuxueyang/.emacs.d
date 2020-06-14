;;; package --- Summary
;;; Commentary:
;;; Code:

;; rust programming language

(use-package rustic
  :ensure t
  :config
  (setq rustic-format-trigger 'on-save))

(use-package rust-playground
  :ensure t
  :bind
  (("<C-return>" . rust-playground-exec)))

(use-package rust-mode
  :ensure t)

(provide 'abel-rust)

;;; abel-rust.el ends here
