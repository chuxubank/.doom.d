;; -*- no-byte-compile: t; -*-
;;; study/review/packages.el

(package! org-drill :pin "35c1ce349949cc213f3076799211210f49431850")

(package! org-fc :recipe (:host github :repo "l3kn/org-fc" :files (:defaults "awk" "demo.org")))

(when (featurep! +roam)
  (package! org-roam-server))

(when (featurep! +anki)
  (package! anki-editor :pin "546774a453ef4617b1bcb0d1626e415c67cc88df"))
