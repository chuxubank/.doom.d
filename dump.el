;;; dump.el -*- lexical-binding: t; -*-

(setq doom-incremental-load-immediately t)
(load (expand-file-name "init.el" user-emacs-directory))

(doom-initialize-packages t)

(setq +dump-exclude-packages '(auctex org-mode revealjs))

(dolist (package doom-packages)
  (let ((package (car package)))
    (unless (member package +dump-exclude-packages)
      (require package))))

(dump-emacs-portable (expand-file-name "doom.pdump" doom-etc-dir))
