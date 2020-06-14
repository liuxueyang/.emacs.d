;;; package --- Summary
;;; Commentary:
;; version control

;;; Code:

(use-package magit
  :ensure t
  :delight)

(use-package ag
  :ensure t)

(use-package ripgrep
  :ensure t)

(use-package projectile
  :ensure t
  :delight
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode +1)
  (setq projectile-switch-project-action 'projectile-vc)
  :bind-keymap
  (("C-c p" . projectile-command-map))
  :requires
  (ag ripgrep))

(provide 'abel-vc)
;;; abel-vc.el ends here
