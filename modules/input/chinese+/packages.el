;; -*- no-byte-compile: t; -*-
;;; input/chinese+/packages.el

(when (featurep! +posframe)
  (package! posframe :pin "aa57a245680655c05720f5c9b3035dacfb9eb011"))
(package! rime :pin "a4e6dc1ba3d189b2a31f0a0535be640310347896")
(package! pangu-spacing :pin "f92898949ba3bf991fd229416f3bbb54e9c6c223")
(package! valign :recipe (:host github :repo "casouri/valign"))
