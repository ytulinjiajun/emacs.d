(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-default-cursor t)
 '(evil-want-C-u-scroll t)
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 80))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "dark green"))))
 '(iedit-occurrence ((t (:inherit region)))))
;; 将项目转接在各文件之间，方便清理和回顾。

(provide 'init-custom)
