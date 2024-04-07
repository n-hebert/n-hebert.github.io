;; -*- flycheck-disabled-checkers: (emacs-lisp-checkdoc); byte-compile-warnings: (not free-vars) -*-
;; Eval this buffer then M-x org-publish
;; You can also use C-c C-e P f in a given file

(defun this-file-name()
  (or load-file-name buffer-file-name (error "No file name to report")))

(setq github-project-root (locate-dominating-file (this-file-name) "_config.yml"))

(setq org-publish-project-alist
  `(
    ("org-n-hebert"
     ;; Path to your org files.
     :base-directory ,(concat github-project-root "org/posts")
     :base-extension "org"
     ;; Path to your Jekyll project.
     :publishing-directory ,(concat github-project-root "_posts")
     :recursive t
     :publishing-function org-html-publish-to-html
     :section-numbers nil
     :headline-levels 4
     :html-extension "html"
     :body-only t
     )
    ("css"
     :base-directory ,(concat github-project-root "org/css")
     :base-extension "css"
     :publishing-directory ,(concat github-project-root "_orgcss")
     :publishing-function org-publish-attachment
     :recursive nil)
    ("all" :components ("org-n-hebert" "css"))
    )
  )

(defun my/publish ()
  "Publish org posts to html"
  (require 'org)
  (org-publish-all))

(provide 'publish)
