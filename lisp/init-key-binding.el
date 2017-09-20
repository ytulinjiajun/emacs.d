(provide 'init-key-binding)
;;--------------------------解除已绑定的快捷键--------------------------------------
(global-unset-key (kbd "C-x f"))	
(global-unset-key (kbd "C-h C-f"))
(global-unset-key (kbd "C-r"))
(global-unset-key (kbd "M-r"))
(global-unset-key (kbd "C-M-d"))

;;-----------------------------绑定快捷键------------------------------------------
;;该快捷键快速使用有道词典查找单词
(global-set-key (kbd "<f4>") 'youdao-dictionary-search-at-point)

;;该快捷键打开.emacs.d/GTD目录
(global-set-key (kbd "<f3>") 'open-my-gtd-dir)

;;自动换行
(global-set-key (kbd "<f5>") 'toggle-truncate-lines)

;;跳转到函数定义
(global-set-key (kbd "C-h C-f") 'find-function)

;;跳转到变量定义
(global-set-key (kbd "C-h C-v") 'find-variable)

;;跳转到快捷键所绑定的函数的定义
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;;buffer管理,可以在右侧高亮显示当前所有的buffer,并可以随意切换过去进行编辑,之后按q即可退出
;;不同于buffer-menu,ibuffer可以高亮显示所有列出的buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;该配置使得按下C-x C-r时，打开最近编辑的文件
(global-set-key (kbd "C-x r") 'recentf-open-files)

;;批量注释
(global-set-key [?\C-c ?\C-/] 'comment-or-uncomment-region)

;;该配置使得可以使用C-r来向后删除一个字符，作用相当于Backspace
(global-set-key (kbd "C-r") 'backward-delete-char)

;;该配置使得可以使用M-r来向后删除一个单词
(global-set-key (kbd "M-r") 'backward-kill-word)

;;删除光标所在的整行
(global-set-key (kbd "C-M-d") 'kill-whole-line)

;;该配置以一个git仓库为对象，给定关键词，遍历搜索整个仓库(前提：安装了helm-ag插件)
;;按下C-c s之后输入关键字，在会车前按下C-c C-e可以进入编辑模式，直接对搜索结果进行更改，C-c C-c完成更改，C-c C-k结束本次编辑
;;对于不需要列出的内容，在对应的关键字前面使用！就可以屏蔽掉
(global-set-key (kbd "C-c s") 'helm-do-ag-project-root)

;;以光标所在位置为基准向两边扩展或缩小选区
(global-set-key (kbd "C-=") 'er/expand-region)

;;使用hippie-expand来增强补全功能，弥补company的不足
(global-set-key (kbd "s-/") 'hippie-expand)

;;使用增强后的occur-mode,经过增强后的occur-dwim能自动抓取光标所在位置的单词进行搜索(备注：occur-mode时emacs自带的模式)
(global-set-key (kbd "M-s o") 'occur-dwim)

;;使用iedit-mode,能够在当前文档中标记某单词，并同时编辑被标记的所有单词(备注：该配置依赖于iedit插件)
;;使用M-s e标记，再次使用则撤销标记，一般情况下结合occur-mode一起使用
(global-set-key (kbd "M-s e") 'iedit-mode)

;;-----------------------------org-mode快捷键-------------------------------------
;; (global-set-key (kbd "C-c C-c") 'org-capture)
;; (global-set-key (kbd "C-c C-a") 'org-agenda)
;; (global-set-key (kbd "C-c C-l") 'org-link)
;; (global-set-key (kbd "C-c C-b") 'org-switchb)

;;在当前光标的位置插入一个同级的TODO标题
(global-set-key [M-s-return] (quote org-insert-todo-heading))

;;在当前同级标题的最后一个标题后面插入同级的TODO标题
 (global-set-key [C-s-return] (quote org-insert-todo-heading-respect-content))

;;该配置使得光标所在的大纲以及该大纲下面的子大纲同时下降一级
(global-set-key [M-s-left] (quote org-promote-subtree))

;;该配置使得光标所在的大纲以及该大纲下面的子大纲同时上升一级
(global-set-key [M-s-right] (quote org-demote-subtree))

(global-set-key [M-s-up] (quote org-move-subtree-up))

(global-set-key [M-s-down] (quote org-move-subtree-down))



