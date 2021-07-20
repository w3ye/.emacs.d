;;; lang-settings.el --- Sets language specific settigns
;;; Commentary:
;;; Code:

;; set javascript indent to 2
(setq js-indent-level 2)
(use-package js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(custom-set-faces
 '(js2-object-property ((t (:inherit font-lock-variable-name-face)))))


(provide 'lang-settings)
;;; lang-settings.el ends here
