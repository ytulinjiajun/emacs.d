;;使自动补全插件company生效
(global-company-mode t)

;;该配置使得company补全列表出现时，可以使用C-n和C-p来进行上下移动
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


(setq-default company-idle-delay 0.08)

(setq-default company-minimum-prefix-length 2)

(provide 'config-company-plugin)
