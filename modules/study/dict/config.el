;;; study/dict/config.el -*- lexical-binding: t; -*-

(use-package! bing-dict
  :commands #'bing-dict-brief
  :config
  (setq bing-dict-vocabulary-save t
        bing-dict-show-thesaurus 'both
        bing-dict-vocabulary-file (expand-file-name "vocabulary.org" org-directory)))

(use-package! anki-vocabulary
  :when (modulep! +anki)
  :commands #'anki-vocabulary
  :custom
  (anki-vocabulary-deck-name "Inbox")
  (anki-vocabulary-model-name "AutoCopy")
  (anki-vocabulary-field-alist '(("expression" . "${expression:单词}")
                                 ("glossary" . "${glossary:释义}")
                                 ("sentence" . "${sentence_bold:标粗的原文例句}"))))
