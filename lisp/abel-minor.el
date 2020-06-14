;;; package --- Summary
;;; Commentary:
;; minor modes

;;; Code:

;; 所有的 window 都启用 ruler-mode
;; TODO: how to disable it in popup window?
;; (add-hook 'window-configuration-change-hook
;;           (lambda ()
;;             (ruler-mode 1)))

(tool-bar-mode -1)
(size-indication-mode 1)
;; (whitespace-newline-mode 1)
(show-paren-mode 1)
;; (scroll-bar-mode -1)

(provide 'abel-minor)
;;; abel-minor.el ends here
