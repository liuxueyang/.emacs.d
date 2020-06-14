;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package lispy
  :ensure t
  :delight
  :hook
  ((emacs-lisp-mode . lispy-mode)
   (lisp-mode . lispy-mode))
  :config
  ;; https://github.com/abo-abo/lispy/issues/132
  ;; unbind a key
  (define-key lispy-mode-map-lispy (kbd "M-o") nil))

(use-package rainbow-blocks
  :delight
  :ensure t
  :hook
  ((emacs-lisp-mode . rainbow-blocks-mode)
   (lisp-mode . rainbow-blocks-mode)))

(use-package rainbow-delimiters
  :ensure t
  :hook
  ((emacs-lisp-mode . rainbow-delimiters-mode)
   (lisp-mode . rainbow-delimiters-mode)))

(use-package sly
  :ensure t)

(provide 'abel-lisp)

;;; abel-lisp ends here
