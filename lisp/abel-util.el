;;; package -- Summary
;;; Commentary:
;;; Code:

(use-package keyfreq
  :ensure t
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(use-package beacon
  :delight
  :ensure t
  :config
  (beacon-mode 1))

(use-package delight
  :ensure t)

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'icons)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

(use-package multiple-cursors
  :ensure t
  :bind (("C-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package string-inflection
  :ensure t
  :bind (("C-c C-r" . string-inflection-all-cycle)))

(use-package smex
  :ensure t
  :bind (("M-x" . smex)))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package highlight-symbol
  :ensure t
  :bind (("M-n" . highlight-symbol-next)
         ("M-p" . highlight-symbol-prev)))

(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode 1))

;; (use-package window-purpose
;;   :ensure t
;;   :config
;;   (purpose-mode))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'minibuffer-setup-hook 'turn-on-smartparens-strict-mode)
  (smartparens-global-mode))

(use-package expand-region
  :ensure t
  :bind
  (("C-=" . er/expand-region)))

;; use American English as ispell default dictionary
(ispell-change-dictionary "american" t)
(setq ispell-extra-args '("--lang=en_US"))
(flyspell-mode)

(use-package 0x0
  :ensure t
  :config)

(provide 'abel-util)

;;; abel-util.el ends here
