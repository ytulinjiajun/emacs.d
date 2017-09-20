(provide 'init-base-config)
;;设定默认工作目录
;;(setq default-directory "~/learn-git")

;;关闭工具栏
(tool-bar-mode -1)

;;关闭滚动条
(scroll-bar-mode -1)

;;关闭菜单栏
(menu-bar-mode -1)

;;设置光标类型
(setq-default cursor-type 'hbar)

;;显示行号
(global-linum-mode t)

;;默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;禁止自动备份文件
(setq make-backup-files nil)

;;禁止自动保存文件
;;(setq auto-save-default nil)

;;自动更新，以便同外部的修改状态同步
(global-auto-revert-mode t)

;;默认禁止响铃
(setq ring-bell-function 'ignore)

;;在小缓冲区显示当前(行号,列号)
(setq column-number-mode t)

;;设定行距
(setq default-line-spacing 4)

;;改善删除的行为,替换而不是追加
(delete-selection-mode t)

;;设置语言环境
(set-language-environment "UTF-8")

;;高亮显示当前行(dark-green)
(global-hl-line-mode t)

;;设置tab缩进的字符数
(setq default-tab-width 4)
	
;;简化yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;;该配置使得可以打开最近访问过的文件
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;;高亮两边括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;高亮显示当前光标两边的括号(支持24/25版本)
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it)))
  )

;;批量注释
(defun my-comment-or-uncomment-region (beg end &optional arg)    
  (interactive (if (use-region-p)    
                   (list (region-beginning) (region-end) nil)    
                 (list (line-beginning-position)    
                       (line-beginning-position 2))))    
  (comment-or-uncomment-region beg end arg)    
)
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region) 

;;使用hippie-expand来进行补全，该补全弥补company补全的不足，快捷键为S-/
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

;;occur-mode:按下M-s o,按照关键词匹配当前文档的条项，在右缓冲区边列举出来，按e切换至编辑模式，按C-c C-c保存修改并切换至预览模式 
;;增强occur-mode,使得按下M-s o时能够自动抓取光标所在位置的单词,然后在当前文档中搜索所有出现该单词的条目并在右边缓冲区列出来
(defun occur-dwim ()
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
