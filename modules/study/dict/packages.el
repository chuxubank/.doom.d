;; -*- no-byte-compile: t; -*-
;;; study/dict/packages.el

(package! bing-dict :pin "1d581aaa9622b34f8fb83af5579fa252aa24cfef")

(when (modulep! +anki)
  (package! anki-vocabulary :pin "863fe0219577f996ab126f1b7902db3c2cc59b2b"))
