;;; dump.el -*- lexical-binding: t; -*-

(load (expand-file-name "init.el" user-emacs-directory))
(setq doom-incremental-load-immediately t)
(doom-run-all-startup-hooks-h)

(dump-emacs-portable (expand-file-name "doom.pdump" doom-etc-dir))
