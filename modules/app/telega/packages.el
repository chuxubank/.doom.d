;; -*- no-byte-compile: t; -*-
;;; app/telega/packages.el

(package! telega)

(when (featurep! +url-shorten)
  (package! telega-url-shorten :type 'local :recipe (:local-repo "telega.el/contrib" :files ("telega-url-shorten.el"))))

(when (featurep! +alert)
  (package! telega-alert :type 'local :recipe (:local-repo "telega.el/contrib" :files ("telega-alert.el"))))

(when (featurep! +mnz)
  (package! language-detection)
  (package! telega-mnz :type 'local :recipe (:local-repo "telega.el/contrib" :files ("telega-mnz.el"))))
