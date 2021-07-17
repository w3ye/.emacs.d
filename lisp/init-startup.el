;; No bells
(setq ring-bell-function #'ignore
      visible-bell nil)
;; Disable startup screen
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; Garbage collection
(setq gc-cons-threshold most-positive-fixnum)
;; Show line numbers
(setq display-line-numbers-type 'absolute)
(global-display-line-numbers-mode t)
;; Authentication for github - magit forge
(setq auth-sources '("~/.authinfo"))
(provide 'init-startup)
