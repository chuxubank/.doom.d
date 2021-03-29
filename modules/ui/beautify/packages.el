;; -*- no-byte-compile: t; -*-
;;; ui/beautify/packages.el

(when (featurep! +nyan)
  (package! nyan-mode :pin "06e67ab2c490756d3eeed4a68aba7c33e508a5d5"))

(package! pangu-spacing :pin "f92898949ba3bf991fd229416f3bbb54e9c6c223")
(package! valign :recipe (:host github :repo "casouri/valign"))
