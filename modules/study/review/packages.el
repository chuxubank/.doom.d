;; -*- no-byte-compile: t; -*-
;;; study/review/packages.el

(package! org-drill :pin "35c1ce349949cc213f3076799211210f49431850")
(package! org-roam-server)
(package! anki-editor :recipe (:host github :repo "chuxubank/anki-editor" :branch "develop"))
(package! bing-dict :pin "1d581aaa9622b34f8fb83af5579fa252aa24cfef")
(package! org-fc :recipe (:host github :repo "l3kn/org-fc" :files (:defaults "awk" "demo.org")))
