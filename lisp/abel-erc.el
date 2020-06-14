;;; package --- Summary
;;; Commentary:
;;; Code:

;; irc

;; password saved in ~/.authinfo like:
;; login your_user_name password your_password

(defun start-irc ()
  "Connect to IRC."
  (interactive)
  (erc-tls
   :server "chat.freenode.net"
   :port 6697)
  (setq erc-autojoin-channels-alist
        '(("freenode.net"
           "#gentoo-cn-offtopic"
           "#archlinux-cn-offtopic"
           "#archlinux-cn"))))

(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(global-set-key "\C-cef" 'start-irc)

(provide 'abel-erc)
;;; abel-erc.el ends here
