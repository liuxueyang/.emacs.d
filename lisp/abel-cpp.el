;;; package -- Summary
;;; Commentary:
;;; Code:

;; for c++

(add-hook 'c++-mode-hook
	  '(lambda ()
	     (c-toggle-auto-hungry-state)))

(defun abel-compile-c++ ()
  "Simple compile c++ file."
  (interactive)
  (let* ((src-file (buffer-file-name))
         (cur-dir (file-name-directory src-file))
         (exe-file (file-name-sans-extension src-file))
         (cmd (format "clang++ -Wall -std=c++11 %s -o %s"
                      src-file exe-file)))
    (shell-command cmd)))

(defun abel-run-execfile ()
  "Simple run c++ or c execute file."
  (interactive)
  (let* ((src-file (buffer-file-name))
         (exe-file (file-name-sans-extension src-file)))
    (shell-command exe-file)))

(add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key (quote [f7]) 'abel-compile-c++)))

(add-hook 'c++-mode-hook
          (lambda ()
            (local-set-key (quote [f8]) 'abel-run-execfile)))

(provide 'abel-cpp)
;;; abel-cpp.el ends here
