;; -*- no-byte-compile: t; -*-
;;; input/chinese+/packages.el

(package! posframe)
(package! liberime-config
  :recipe (:host github :repo "merrickluo/liberime" :files ("CMakeLists.txt" "Makefile" "src" "liberime-config.el")))
