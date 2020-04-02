;; -*- no-byte-compile: t; -*-
;;; input/chinese+/packages.el

(package! posframe)
(package! rime
  :recipe (:host github :repo "DogLooksGood/emacs-rime" :files ("*.el" "Makefile" "lib.c")))
(package! pangu-spacing)
