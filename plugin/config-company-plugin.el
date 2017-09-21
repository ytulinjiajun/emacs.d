;;使自动补全插件company生效
(global-company-mode t)

;;该配置使得company补全列表出现时，可以使用C-n和C-p来进行上下移动
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;------------------------------------------------------------------
;; 1. 使用hippie-expand来进行补全，该补全弥补company补全的不足
;; 2. 快捷键为M-/
;; 3. company只能补全“”里面的，而类似～/.emacs.d/lisp这种路径无法补全
;;------------------------------------------------------------------
(setq hippie-expaynd-try-funhvctions-list '(try-expand-dabbrev
											try-expand-all-abbrevs
											try-expand-dabbrev-from-kill
											try-complete-file-name-partially
											try-complete-file-name
											try-expand-list
											try-expand-line
											try-complete-lisp-symbol-partially
											try-complete-lisp-symbol
											))
(global-set-key (kbd "M-/") 'hippie-expand)

(setq-default company-idle-delay 0.08)

(setq-default company-minimum-prefix-length 2)

(provide 'config-company-plugin)
