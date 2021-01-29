;; -*- no-byte-compile: t; -*-
;;; app/telega/packages.el

(package! telega)
(when (featurep! +mnz)
  (package! language-detection))
