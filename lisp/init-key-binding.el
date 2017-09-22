(provide 'init-key-binding)
;;--------------------------解除已绑定的快捷键--------------------------------------
(global-unset-key (kbd "C-x f"))	
(global-unset-key (kbd "C-h C-f"))
(global-unset-key (kbd "C-r"))
(global-unset-key (kbd "M-r"))
(global-unset-key (kbd "C-M-d"))


;;-----------------------------绑定快捷键------------------------------------------
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

;;该配置使得可以使用C-r来向后删除一个字符，作用相当于Backspace
(global-set-key (kbd "C-r") 'backward-delete-char)

;;该配置使得可以使用M-r来向后删除一个单词
(global-set-key (kbd "M-r") 'backward-kill-word)

;;删除光标所在的整行
(global-set-key (kbd "C-M-d") 'kill-whole-line)




