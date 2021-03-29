;; -*- no-byte-compile: t; -*-
;;; input/rime/packages.el

(package! rime :pin "519e6eb3b5e8e668c2835d27f54fcf5776242576")

(when (featurep! +posframe)
  (package! posframe :pin "fff21ccb706b576f4074883f9fa87d2bcc534096"))
