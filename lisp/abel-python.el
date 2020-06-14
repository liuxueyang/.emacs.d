;;; package -- Summary
;;; Commentary:
;;; Code:


;; python setting

(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t
		  python-indent 4
		  tab-width 4)
	    (whitespace-mode 1)))

;; (use-package elpy
;;   :ensure t
;;   :config
;;   (elpy-enable))

(provide 'abel-python)

;;; abel-python.el ends here
