;;; simple-blog.el --- summary -*- lexical-binding: t -*-

;; Author: liuxueyang
;; Maintainer: liuxueyang
;; Version: 0.1
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:
;; Configurations for blog
;; Make it simple

;; If you don't use it, then it's not useful to you.

;; commentary

;;; Code:

(require 'ox-publish)

(setq org-html-head-include-default-style nil
      ;; org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/style.css\" />"
      )

(defun ™/org-publish-org-sitemap-format (entry style project)
  "Custom sitemap entry formatting: add date"
  (cond ((not (directory-name-p entry))
         (format "[[file:%s][(%s) %s]]"
                 entry
                 (format-time-string "%Y-%m-%d"
                                     (org-publish-find-date entry project))
                 (org-publish-find-title entry project)))
        ((eq style 'tree)
         ;; Return only last subdir.
         (file-name-nondirectory (directory-file-name entry)))
        (t entry)))

(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/org/"
         :base-extension "org"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         :section-numbers nil
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "好玩的東西"
         :sitemap-format-entry ™/org-publish-org-sitemap-format)
        ("org-static"
         :base-directory "~/org/"
         :base-extension "css\\|png\\|jpg\\|jpeg\\|pdf\\|mp3\\|js"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("org"
         :components ("org-notes" "org-static"))))

(provide 'simple-blog)

;;; simple-blog.el ends here
