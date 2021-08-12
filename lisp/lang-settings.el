;;; lang-settings.el --- Sets language specific settigns
;;; Commentary:
;;; Code:

;; set javascript indent to 2
(setq js-indent-level 2)
(use-package js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(custom-set-faces
 '(js2-object-property ((t (:inherit font-lock-variable-name-face)))))

(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-script-padding 2))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))

(setq-default css-indent-offset 2)

(provide 'lang-settings)
;;; lang-settings.el ends here
