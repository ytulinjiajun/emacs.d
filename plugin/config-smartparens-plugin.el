;;引号，括号等自动匹配
(smartparens-global-mode t)

;;禁止自动匹配单引号
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(provide 'config-smartparens-plugin)
