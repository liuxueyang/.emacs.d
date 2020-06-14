;;; package -- Summary
;;; Commentary:
;;; Code:

;; org-mode settings

;; set Org mode as the default major mode
;; (setq-default major-mode 'org-mode)

(setq org-plantuml-jar-path
      (expand-file-name (concat user-emacs-directory
                                "lisp/lib/plantuml.jar")))

(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((plantuml . t)
                                 (emacs-lisp . t))))

(defadvice org-html-paragraph (before org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without unwanted space when exporting `org-mode` to html."
  (let* ((origin-contents (ad-get-arg 1))
         (fix-regexp "[[:multibyte:]]")
         (fixed-contents
          (replace-regexp-in-string
           (concat
            "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
    (ad-set-arg 1 fixed-contents)))

(use-package htmlize
  :ensure t)

(global-set-key (kbd "C-c a") 'org-agenda)

(use-package ob-rust
  :ensure t)

(provide 'abel-org)

;;; abel-org.el ends here
