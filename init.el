;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       vertico

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
       (vc-gutter +pretty)
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
       biblio
       editorconfig
       (eval +overlay)
       gist
       (lookup +dictionary)
       (lsp +peek)
       magit
       make
       pass
       pdf

       :os
       (:if IS-MAC macos)

       :lang
       (cc +lsp)
       clojure
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
       zig

       :email
       (mu4e +org +gmail)

       :app
       (rss +org)
       leetcode
       (telega +url-shorten +alert +mnz)
       (emms +ncm)

       :config
       (default +bindings +smartparens)

       :study
       (review +media-note +roam-server)
       (dict +anki)
       )
