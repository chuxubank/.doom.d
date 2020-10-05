;; -*- no-byte-compile: t; -*-
;;; study/pdf+/packages.el

(when (featurep! :study pdf+ +noter)
  (package! org-noter-pdftools :pin "3c2b9a413eb841c781cfb49d8c343bf07aa0ad1f"))
