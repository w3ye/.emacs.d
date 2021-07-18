;;; lsp.el --- init lsp
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (html-mode . lsp-deferred)
	 (css-mode . lsp-deferred)
	 (javascript-mode . lsp-deferred)
	 (typescript-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp lsp-deferred)
(provide 'lsp)
;;; lsp.el ends here
