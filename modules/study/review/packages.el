;; -*- no-byte-compile: t; -*-
;;; study/review/packages.el

(package! org-drill :pin "35c1ce349949cc213f3076799211210f49431850")

(when (featurep! +fc)
  (package! org-fc :recipe (:host github :repo "l3kn/org-fc" :files (:defaults "awk" "demo.org"))))

(when (featurep! +media-note)
  (package! mpv :pin "d7bb3a70829203be827505c40f761d197494817b")
  (package! pretty-hydra :pin "20362323f66883c1336ffe70be24f91509addf54")
  (package! org-media-note :recipe (:host github :repo "yuchen-lea/org-media-note")))

(when (featurep! +roam-server)
  (package! org-roam-server))

(when (featurep! +anki)
  (package! anki-editor :pin "546774a453ef4617b1bcb0d1626e415c67cc88df"))
