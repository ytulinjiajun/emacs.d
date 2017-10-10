;;------------------------------------------------------------------
;; 光标向上移动一个节点：C-c C-p
;; 光标向下移动一个节点：C-c C-n
;; 在同一level下，光标向下移动一个节点：C-c C-f
;; 在同一level下，光标向上移动一个节点：C-c C-b
;; 光标移动到上一级level：C-c C-u
;;
;; 显示该org文档的所有大纲而不显示细节：C-c C-k
;; 显示该level下的所有大纲而不显示细节:C-c <TAB>
;; 将光标当前所在的level单独提取出来，在另外一个窗口方便编辑：C-c C-x b
;;
;; 将光标的所在行的levl提升一个等级：M-right
;; 将光标当前所在行的level下降一个等级：M-left
;; 将光标当前所在的level连同其sublevel提升一个等级：M-S-right
;; 将光标当前所在行的level连同其sublevel下降一个等级：M-S-left
;; 将光标当前所在行的level向上移动一个位置:M-up
;; 将光标当前所在行的level向下移动一个位置:M-down 
;;------------------------------------------------------------------
(global-set-key [M-s-left] (quote org-promote-subtree))

(global-set-key [M-s-right] (quote org-demote-subtree))

(global-set-key [M-s-up] (quote org-move-subtree-up))

(global-set-key [M-s-down] (quote org-move-subtree-down))

(provide 'config-org-outline-mode)
