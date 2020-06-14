;;;; package --- Summary

;;; Commentary:

;;; Code:

;; windows operations

;; use S-arrow_keys to move cursor around split windows
(windmove-default-keybindings)

;; record the changes in the window configuration so that the changes can be "undone" using
;; 'C-c <left>' and 'C-c <right>'
(winner-mode)

;; 以下两种方法不生效，不知道为什么
;; (add-hook 'after-init-hook 'toggle-frame-maximized)
;; (set-frame-size (selected-frame) 138 100)

;; TODO:
(unless (frame-parameter nil 'fullscreen)
  (toggle-frame-maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (add-to-list 'default-frame-alist '(height . 42))

(use-package ace-window
  :ensure t
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind
  (("M-o" . ace-window)))

(provide 'abel-window)

;;; abel-window.el ends here
