;;; init.el -*- lexical-binding: t; -*-

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
       ;; beautify

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
       (syntax +childframe)
       (spell +flyspell)

       :tools
       biblio
       editorconfig
       (eval +overlay)
       gist
       (lookup +docsets +dictionary)
       lsp
       magit
       pass
       pdf

       :os
       (:if IS-MAC macos)

       :lang
       (cc +lsp)
       (:if IS-MAC clojure)
       data
       emacs-lisp
       (json +lsp)
       (java +lsp)
       (javascript +lsp)
       (kotlin +lsp)
       (latex +latexmk +cdlatex +lsp +fold)
       markdown
       (org +dragndrop +hugo +jupyter +pomodoro +present +roam +noter +pretty)
       plantuml
       (python +lsp)
       sh
       (:if IS-MAC (swift +lsp))
       web
       yaml

       :app
       (rss +org)
       leetcode
       (:unless IS-WINDOWS
        (telega +url-shorten +alert +mnz))

       :config
       (default +bindings +smartparens)

       :input
       (chinese+ +valign)

       :study
       (review +roam)
       (dict +anki)
       )
