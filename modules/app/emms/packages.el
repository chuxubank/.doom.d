;; -*- no-byte-compile: t; -*-
;;; app/emms/packages.el

(package! emms)

(when (modulep! +ncm)
  (package! ncm :recipe (:host github :repo "SpringHan/netease-cloud-music.el"))
  (package! request)
  (package! async))
