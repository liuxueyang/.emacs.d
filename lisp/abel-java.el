;;; package -- Summary
;;; Commentary:
;;; Code:

;; http://ergoemacs.org/emacs/elisp_file_name_dir_name.html

(defun abel-compile-java ()
  "Simple compile Java file."
  (interactive)
  (let* ((src-file (buffer-file-name))
         (cur-dir (file-name-directory src-file))
         (cmd (format "javac -d %s %s"
                      cur-dir src-file)))
    (shell-command cmd)))

(defun abel-run-java ()
  "Simple run Java class file."
  (interactive)
  (let* ((src-file (buffer-file-name))
         (exe-file (file-name-nondirectory
                    (file-name-sans-extension src-file)))
         (cmd (format "java %s" exe-file)))
    (shell-command cmd)))

(add-hook 'java-mode-hook
          (lambda ()
            (local-set-key (quote [f7]) 'abel-compile-java)))

(add-hook 'java-mode-hook
          (lambda ()
            (local-set-key (quote [f8]) 'abel-run-java)))

(provide 'abel-java)

;;; abel-java.el ends here
