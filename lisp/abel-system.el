;;; package --- Summary
;;; Commentary:
;;; Code:

(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'meta
        ;; mac-right-command-modifier 'meta
        mac-option-modifier 'meta
        ;; mac-command-modifier 'meta
        ))

(provide 'abel-system)

;;; abel-system.el ends here
