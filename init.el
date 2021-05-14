;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       ivy

       :input
       (rime +posframe)
       ;; sis

       :ui
       doom
       ;; doom-dashboard
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
       make
       pass
       pdf

       :os
       (:if IS-MAC macos)

       :lang
       (cc +lsp)
       (csharp +lsp +dotnet)
       (:if IS-MAC clojure)
       data
       emacs-lisp
       (json +lsp)
       (java +lsp)
       (javascript +lsp)
       (kotlin +lsp)
       (latex +latexmk +cdlatex +lsp)
       markdown
       mermaid
       (org +dragndrop +hugo +jupyter +pomodoro +present +roam +noter +pretty)
       plantuml
       (python +lsp)
       (sh +lsp)
       (:if IS-MAC (swift +lsp))
       (web +lsp)
       (yaml +lsp)

       :email
       (wanderlust +gmail)

       :app
       (rss +org)
       leetcode
       (:unless IS-WINDOWS
        (telega +url-shorten +alert +mnz))
       (emms +ncm)

       :config
       (default +bindings +smartparens)

       :study
       (review +media-note +roam-server)
       (dict +anki)
       )
