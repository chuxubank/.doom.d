;;; ~/.doom.d/+latex.el -*- lexical-binding: t; -*-

(setq +latex-viewers '(pdf-tools))

;;;###package cdlatex
(setq cdlatex-env-alist
      '(("equation*" "\\begin{equation*}\n?\n\\end{equation*}" nil)
        ("cases" "\\begin{cases}\n? & ,\\\\\n & .\n\\end{cases}" nil)
        ("tikzpicture" "\\begin{tikzpicture}\n?\n\\end{tikzpicture}" nil)))
(setq cdlatex-command-alist
      '(("equ*" "Insert equation* env" "" cdlatex-environment ("equation*") t nil)
        ("cas" "Insert cases env" "" cdlatex-environment ("cases") t nil)
        ("tikz" "Insert tikzpicture env" "" cdlatex-environment ("tikzpicture") t nil)))
(setq cdlatex-math-modify-alist
      '((86 "\\vb*" nil t nil nil)
        (98 "\\bm" nil t nil nil)))
(setq cdlatex-math-symbol-alist
      '((76 ("\\Lambda" "\\varLambda"))))

(after! cdlatex
  (setq cdlatex-use-dollar-to-ensure-math t)
  (map! :map cdlatex-mode-map
        "TAB" #'cdlatex-tab))

;;;###package smartparens
(after! smartparens
  (sp-with-modes '(org-mode)
    (sp-local-pair "$" "$")
    (sp-local-pair "\\[" "\\]")))
