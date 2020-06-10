;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load in.
;; Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find information about all of Doom's modules
;;      and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c g k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c g d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :completion
       company
       ivy

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       modeline
       nav-flash
       ophints
       (popup +defaults)
       treemacs
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       multiple-cursors
       snippets
       word-wrap

       :emacs
       dired
       electric
       undo
       vc

       :term
       eshell

       :checkers
       syntax
       (:if IS-MAC spell)

       :tools
       editorconfig
       (eval +overlay)
       gist
       (lookup +docsets +dictionary)
       lsp
       (:if IS-MAC macos)
       magit
       pdf

       :lang
       (cc +lsp)
       (:if IS-MAC clojure)
       data
       emacs-lisp
       (java +lsp)
       (javascript +lsp)
       latex
       markdown
       (org +dragndrop +hugo +jupyter +pomodoro +present +roam +noter)
       plantuml
       (python +lsp)
       sh
       (:if IS-MAC (swift +lsp))
       web
       yaml

       :app
       (rss +org)

       :config
       (default +bindings +smartparens)

       :input
       chinese+
       math

       :study
       review
       leetcode
       )
