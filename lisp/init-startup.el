;;; init-startup.el --- init startup
;;; Commentary:
;;; Code:
;; No bells
(setq ring-bell-function #'ignore
      visible-bell nil)
;; Disable startup screen
(setq inhibit-startup-screen t)
(set-frame-font "FiraCode NF 13" nil t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(global-visual-line-mode 1)
;; Saves auto saves file to ~/.saves
(setq backup-directory-alist `(("." . "~/.saves")))
;; Garbage collection
(setq gc-cons-threshold most-positive-fixnum)
;; Show line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; Authentication for github - magit forge
(setq auth-sources '("~/.authinfo"))
(provide 'init-startup)
;;; init-startup.el ends here
