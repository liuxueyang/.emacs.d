;;; package --- Summary

;;; Commentary:
;; completion plugins

;;; Code:

(use-package ivy
  :ensure t
  :delight
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1))

;; You can edit the text in the *grep* buffer after typing `C-c C-p` .
;; After that the changed text is highlighted.
;; The following keybindings are defined:

;; * `C-c C-e`: Apply the changes to file buffers.
;; * `C-c C-u`: All changes are unmarked and ignored.
;; * `C-c C-d`: Mark as delete to current line (including newline).
;; * `C-c C-r`: Remove the changes in the region (these changes are not
;;   applied to the files. Of course, the remaining
;;   changes can still be applied to the files.)
;; * `C-c C-p`: Toggle read-only area.
;; * `C-c C-k`: Discard all changes and exit.
;; * `C-x C-q`: Exit wgrep mode.
(use-package wgrep
  :ensure t
  :custom
  (wgrep-auto-save-buffer t)
  (wgrep-change-readonly-file t))

(use-package avy
  :ensure t
  :bind (("M-g w" . avy-goto-word-1)
         ("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g g" . avy-goto-line)
         ("C-c C-j" . avy-resume))
  :config
  (avy-setup-default))

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :delight
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0
        company-minimum-prefix-length 1
        company-global-modes '(not eshell-mode))
  (global-company-mode))

;; Optional - provides snippet support.
(use-package yasnippet
  :delight
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode)
  :config
  (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t)

(provide 'abel-completion)

;;; abel-completion ends here
