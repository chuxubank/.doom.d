;; -*- no-byte-compile: t; -*-
;;; study/review/packages.el

(package! org-drill :pin "35c1ce349949cc213f3076799211210f49431850")
(package! org-roam-server :pin "7617ac01a1b7bad61407916ef03eda95c17da7c9")
(package! anki-editor :pin "546774a453ef4617b1bcb0d1626e415c67cc88df")
(package! bing-dict :pin "1d581aaa9622b34f8fb83af5579fa252aa24cfef")
(package! org-fc :recipe (:host github :repo "l3kn/org-fc" :files (:defaults "awk" "demo.org")))
