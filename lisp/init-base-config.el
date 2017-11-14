(provide 'init-base-config)

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
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;设置启动时窗口位置为屏库左上角(0,0)
(set-frame-position (selected-frame) 75 45)

;;设置启动是的宽和高
(set-frame-width (selected-frame) 85)
(set-frame-height (selected-frame) 25)

;; 设置字体大小(M-x: describe-font)
(set-default-font "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")

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
(setq default-tab-width 8)

;;简化yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;;该配置使得可以打开最近访问过的文件
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;;批量注释
(defun my-comment-or-uncomment-region (beg end &optional arg)    
  (interactive (if (use-region-p)    
                   (list (region-beginning) (region-end) nil)    
                 (list (line-beginning-position)    
                       (line-beginning-position 2))))    
  (comment-or-uncomment-region beg end arg)    
  )
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)
(global-set-key [?\C-c ?\C-/] 'comment-or-uncomment-region)

;;------------------------------------------------------------------
;; 该配置使得不用选中选取直接按TAB就能对当前缓冲区进行排版
;;------------------------------------------------------------------ 
;; (defun indent-buffer()
;;   (interactive)
;;   (indent-region (point-min) (point-max)))

;; (defun indent-region-or-buffer()
;;   (interactive)
;;   (save-excursion
;;     (if (region-active-p)
;; 		(progn
;; 		  (indent-region (region-beginning) (region-end))
;; 		  (message "Indent selected region."))
;;       (progn
;; 		(indent-buffer)
;; 		(message "Indent buffer.")))))
;; (global-unset-key (kbd "C-i"))
;; (global-set-key (kbd "C-i") 'indent-region-or-buffer)

;;------------------------------------------------------------------
;; 该配置的作用是，将光标所在行的上面开辟一个对齐的新行，并将光标移动至该新行
;;------------------------------------------------------------------ 
(defun ljj/down-line-backp()
  (interactive)
  (progn
	(move-end-of-line 1)
	(newline-and-indent)
	))
(global-set-key (kbd "C-c n") 'ljj/down-line-backp)

;;------------------------------------------------------------------
;; 该配置的作用是,排版
;;------------------------------------------------------------------ 
(defun ljj/auto-indent-and-number ()
  (interactive)
  (progn
	(org-beginning-of-line t)
	(hungry-delete-backward 1 nil)
	(org-meta-return t)
	(next-line 1)
	))
(global-set-key (kbd "C-c t") 'ljj/auto-indent-and-number)


;;------------------------------------------------------------------
;; 改善M-Enter
;;------------------------------------------------------------------
(defun ljj/improve-alt-return ()
  (interactive)
  (progn
    (ljj/down-line-backp)
    (org-insert-heading t)
    ))
(global-set-key  (kbd "C-c r") 'ljj/improve-alt-return)
