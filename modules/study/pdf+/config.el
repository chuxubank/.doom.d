;;; study/pdf+/config.el -*- lexical-binding: t; -*-

(use-package! org-noter-pdftools
  :when (featurep! +noter)
  :after org-noter
  :config
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

(use-package! pdf-continuous-scroll-mode
  :when (featurep! +scroll)
  :hook (pdf-view-mode . pdf-continuous-scroll-mode)
  :config
  (map! :map pdf-continuous-scroll-mode-map
        :n "j" #'pdf-continuous-scroll-forward
        :n "k" #'pdf-continuous-scroll-backward
        :n "<mouse-5>" #'pdf-cs-mouse-scroll-forward
        :n "<mouse-4>" #'pdf-cs-mouse-scroll-backward
        :n "J" #'pdf-continuous-next-page
        :n "K" #'pdf-continuous-previous-page
        :n "C-j" #'pdf-view-scroll-up-or-next-page
        :n "C-k" #'pdf-view-scroll-down-or-previous-page
        :n "g t" #'pdf-cscroll-view-goto-page
        :n "g g" #'pdf-cscroll-first-page
        :n "G" #'pdf-cscroll-last-page
        :n "M" #'pdf-cscroll-toggle-mode-line
        :n "q" #'pdf-cscroll-kill-buffer-and-windows
        :n "l" #'pdf-cscroll-image-forward-hscroll
        :n "h" #'pdf-cscroll-image-backward-hscroll))
