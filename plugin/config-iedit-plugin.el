;;------------------------------使用说明-----------------------------
;; 1. 标记:按M-s e, 光标所在的单词会被标记且高亮，再按M-s e,会退出标记
;; 2. 标记的本质：同时操作
;;------------------------------------------------------------------ 

(global-set-key (kbd "M-s e") 'iedit-mode)

(provide 'config-iedit-plugin)
