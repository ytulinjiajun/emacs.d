(provide 'config-cc-plugin)

;;设置为"linux"的风格而不是"gnu"的风格
(setq c-default-style "linux") 

;;设置cc-mode模式下，tab键的缩进字符数
(setq c-basic-offset 4)

;;关闭electric indentation
(setq-default c-electric-flag nil)

(defun my-make-CR-do-indent ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))

(add-hook 'c-initialization-hook 'my-make-CR-do-indent)
