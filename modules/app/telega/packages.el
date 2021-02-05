;; -*- no-byte-compile: t; -*-
;;; app/telega/packages.el

(package! telega :pin "f87858583ca7c0e4328f3373aa57d715fd25bbb7")

(when (featurep! +url-shorten)
  (package! telega-url-shorten
    :recipe
    (:host github
     :repo "zevlg/telega.el"
     :branch "master"
     :files ("contrib/telega-url-shorten.el"))))

(when (featurep! +alert)
  (package! telega-alert
    :recipe
    (:host github
     :repo "zevlg/telega.el"
     :branch "master"
     :files ("contrib/telega-alert.el"))))

(when (featurep! +mnz)
  (package! language-detection)
  (package! telega-mnz
    :recipe
    (:host github
     :repo "zevlg/telega.el"
     :branch "master"
     :files ("contrib/telega-mnz.el"))))
