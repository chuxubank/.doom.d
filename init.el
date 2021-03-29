;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       ivy

       :input
       rime
       ;; sis

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       modeline
       nav-flash
       ophints
       (popup +defaults)
       vc-gutter
       window-select
       workspaces
       zen
       beautify

       :editor
       meow
       file-templates
       (format +onsave)
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
       (spell +flyspell)

       :tools
       editorconfig
       (eval +overlay)
       gist
       (lookup +dictionary)
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

       :email
       (wanderlust +gmail)

       :app
       (rss +org)
       leetcode
       (:unless IS-WINDOWS
        (telega +modeline +url-shorten +alert +mnz))
       (emms +ncm)

       :config
       (default +bindings +smartparens)

       :study
       (review +media-note +roam-server)
       (dict +anki)
       )
