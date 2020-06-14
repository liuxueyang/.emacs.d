;;; package -- Summary
;;; Commentary:
;;; Code:

;; whitespace setting

(setq whitespace-style
      '(face trailing tabs tab-mark))

(setq-default indent-tabs-mode nil)

(use-package whitespace-cleanup-mode
  :delight
  :ensure t
  :config
  (global-whitespace-cleanup-mode))

(whitespace-mode)

(provide 'abel-whitespace)

;;; abel-whitespace.el ends here
