;; -*- no-byte-compile: t; -*-
;;; input/chinese+/packages.el

(package! pyim :pin "6871fb6f76")
(package! posframe)
(package! liberime
  :recipe (:host github :repo "merrickluo/liberime" :files ("CMakeLists.txt" "Makefile" "src" "liberime*.el"))
  :pin "8c84d5daa2")
