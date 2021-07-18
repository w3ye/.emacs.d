;;; init.el --- init the emacs config file
;;; Commentary:
;;; Code:
(add-to-list 'load-path(expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-startup)
(require 'init-elpa)
(require 'init-packages)
(require 'init-ui)
(require 'global-keybinds)
(require 'lsp)

;; If custom.el exists, load custom.el
(when (file-exists-p custom-file)
  (load-file custom-file))

;;; init.el ends here
