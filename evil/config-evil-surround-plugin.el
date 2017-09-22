;;------------------------使用说明-----------------------------------
;; 用途：在选取两边加上‘ “ ( {
;; 1. 在单词两边添加”world“:viw, S , "
;; 2. 修改单词"world"两边的单引号为(world):cs " )
;; 3. 去除单词"world"两边的单引号：cs " g
;;------------------------------------------------------------------ 
(require 'evil-surround)
(global-evil-surround-mode 1)

(provide 'config-evil-surround-plugin)
