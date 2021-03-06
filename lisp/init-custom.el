(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-default-cursor nil)
 '(evil-default-state (quote emacs))
 '(evil-want-C-u-scroll t)
 '(package-selected-packages
   (quote
    (company-shell company-cmake monokai-theme company hungry-delete swiper counsel smartparens popwin ace-jump-mode expand-region iedit helm-ag sr-speedbar org-pomodoro window-numbering which-key evil evil-leader evil-surround evil-nerd-commenter youdao-dictionary yafolding)))
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
