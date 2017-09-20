;;开启缩写模式：输入缩写词，按空格键，将进行缩写词的原型替换(需要M-x:abbrev-mode来激活缩写词模式)
(setq default-abbrev-mode t)

(define-abbrev-table
  'global-abbrev-table '(
                         ("8zs" ";;------------------------------------------------------------------
;; 
;;------------------------------------------------------------------")
                         ))

(provide 'config-abbrev-mode)
