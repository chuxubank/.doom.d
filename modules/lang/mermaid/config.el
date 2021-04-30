;;; lang/mermaid/config.el -*- lexical-binding: t; -*-

(use-package! mermaid-mode
  :mode "\\.mmd\\'"
  :config
  (setq mermaid-tmp-dir (expand-file-name "mermaid" doom-cache-dir)
        mermaid-output-format ".svg"
        mermaid-config-file "~/.config/mmdc/config.json"
        mermaid-flags (concat "-b transparent -t dark -c " mermaid-config-file))
  (defun org-babel-execute:mermaid (body params)
    "Execute command with BODY and PARAMS from src block."
    (let* ((out-file (or (cdr (assoc :file params))
                         (org-babel-temp-file "mermaid-" mermaid-output-format)))
           (temp-file (org-babel-temp-file "mermaid-"))
           (cmd (concat (shell-quote-argument mermaid-mmdc-location)
                        " -o " (org-babel-process-file-name out-file)
                        " -i " temp-file
                        " " mermaid-flags)))
      (with-temp-file temp-file (insert body))
      (org-babel-eval cmd "")
      (unless (cdr (assq :file params))
        out-file))))
