;; -*- no-byte-compile: t; -*-
;;; study/pdf+/packages.el

(when (modulep! +noter)
  (package! org-noter-pdftools :pin "3c2b9a413eb841c781cfb49d8c343bf07aa0ad1f"))

(when (modulep! +scroll)
  (package! pdf-continuous-scroll-mode :recipe (:host github :repo "dalanicolai/pdf-continuous-scroll-mode.el")))
