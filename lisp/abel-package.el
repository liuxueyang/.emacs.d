;;; package -- Summary
;;; Commentary:
;;; Code:

;; packages

(setq package-archives
      '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
        ("melpa" . "http://elpa.emacs-china.org/melpa/")
	("marmalade" . "https://marmalade-repo.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package gnu-elpa-keyring-update
  :ensure t)
;; gpg2 --keyserver hkp://pool.sks-keyservers.net:80 --homedir $HOME/Documents/Emacs/elpa/gnupg --recv-keys 066DAFCB81E42C40

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (and (memq window-system '(mac ns x))
	     (not (eq system-type 'berkeley-unix)))
    (exec-path-from-shell-initialize)))

(provide 'abel-package)

;;; abel-package.el ends here
