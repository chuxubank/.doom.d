;;; +map.el -*- lexical-binding: t; -*-

(when (featurep! :editor evil)
  (setq! evil-disable-insert-state-bindings t)
  (set-evil-initial-state! '(pdf-annot-list-mode) 'emacs)
  (evil-collection-init '(osx-dictionary))
  (map! :i "C-SPC" nil
        :i "C-@" nil
        (:prefix "C-x"
         :i "C-l" nil
         :i "C-k" nil
         :i "C-f" nil
         :i "C-]" nil
         :i "s"   nil
         :i "C-s" nil
         :i "C-o" nil
         :i "C-n" nil
         :i "C-p" nil)
        (:after evil-org :map evil-org-mode-map
         :i "C-l" nil
         :i "C-h" nil
         :i "C-k" nil
         :i "C-j" nil)))

(map! (:leader
       (:prefix ("a" . "app")
        (:when (featurep! :app eaf)
         :desc "EAF"            "e" #'eaf)
        (:when (featurep! :app telega)
         :desc "Telega"         "t" telega-prefix-map)
        (:when (featurep! :app leetcode)
         :desc "LeetCode"       "l" #'leetcode)
        (:when (featurep! :app rss)
         :desc "Elfeed RSS"     "r" #'elfeed)
        (:when (featurep! :app ncm)
         :desc "Netease Music"  "m" #'netease-cloud-music))

       (:prefix ("d" . "dictionary")
        (:when (featurep! :study dict)
         :desc "Bing"           "b" #'bing-dict-brief)
        (:when (featurep! :study dict +anki)
         :desc "Anki"           "a" #'anki-vocabulary)
        (:when (and (featurep! :tools lookup +dictionary) IS-MAC)
         :desc "OSX"            "o" #'osx-dictionary-search-input))

       (:prefix ("n" . "notes")
        (:prefix ("r" . "roam")
         (:when (featurep! :study review +roam-server)
          :desc "Open server"   "o" #'org-roam-server-open))))

      (:map help-map
       "dU" #'doom/upgrade))
