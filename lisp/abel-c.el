;;; package -- Summary
;;; Commentary:
;;; Code:

;; for C

(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-toggle-auto-hungry-state)))

(provide 'abel-c)

;;; abel-c.el ends here
