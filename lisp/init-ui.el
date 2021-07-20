;;; init-ui.el --- init the ui
;;; Commentary:
;;; Code:
;; Install all-the-icons so doom-modeline will work
(use-package all-the-icons)

(use-package doom-themes
  :init
  (load-theme 'doom-palenight t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 14)))

(provide 'init-ui)
;;; init-ui.el ends here
