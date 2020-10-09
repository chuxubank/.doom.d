;;; ui/beautify/config.el -*- lexical-binding: t; -*-

(use-package! nyan-mode
  :custom
  (nyan-animate-nyancat t)
  (nyan-wavy-trail t)
  :hook
  (doom-modeline-mode . nyan-mode))
