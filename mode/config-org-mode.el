(provide 'config-org-mode)
(require 'org)
(require 'org-pomodoro)

;;------------------------------------------------------------------
;; 定位gtd文件所在目录
;;------------------------------------------------------------------
(defun open-my-gtd-dir ()
  (interactive)
  (find-file "~/.my-agenda"))
(global-set-key (kbd "<f3>") 'open-my-gtd-dir)

;;------------------------------------------------------------------
;; 指定my-agenda的搜索路径
;;------------------------------------------------------------------ 
(setq-default org-agenda-files (quote ("~/.my-agenda")))

;;------------------------------------------------------------------
;; t: 开机自动显示日程表
;;------------------------------------------------------------------
(org-agenda-list t)

;;全屏显示agenda
(setq-default org-agenda-window-setup (quote current-window))

;;------------------------------------------------------------------
;; 番茄时间工作法
;;------------------------------------------------------------------ 
(setq-default org-pomodoro-length 40)
(global-set-key (kbd "C-c p") 'org-pomodoro)


;;高亮BEGIN_SRC里面的代码,插入这个宏的快捷键是：<s回车
(setq org-src-fontify-natively t)

;;gtd快捷键
(define-key global-map "\C-c\C-c" 'org-capture)
(define-key global-map "\C-c\C-a" 'org-agenda)


;; 优先级范围和默认(A-D)任务的优先级
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?D)
(setq org-default-priority ?C)

;;该配置定义了所有.org文档的默认任务状态都为如下所示(不仅仅只有TODO，DONE，NONE三种)
;;(1)可以定义多组状态序列，每个“#+SEQ_TODO”行定义一组状态之间用空格分隔
;;(2)可以在()中定义附加选项，包括： 
;;	字符：该状态的快捷键
;;      ！：切换到该状态时会自动增加时间戳
;;	@ ：切换到该状态时要求输入文字说明
;; 	| ：分隔未完成状态和已完成状态
;;备注： 如果同时设定@和！，使用“@/!”
;;(3)使用快捷键C-c C-t可以列出所有在下面定义的可供选择的任务状态，然后键入对应的字符即可切换到对应的状态
;;(4)NEXT:下一步行动，但还未开始计划，若计划成功后转为TODO
(setq org-todo-keywords
	  '((sequence "INBOX(i)" "TODO(t!)" "WAITTING(w@/!)" "|" "ABORT(a@/!)" "DONE(d@/!)")))
;;设置TODO关键词的外观
(setq org-todo-keyword-faces
	  '(("TODO" .      (:foreground "red" :weight bold :underline t))
		("DONE" .      (:foreground "green" :weight bold :underline t))
		("ABORT" .     (:foreground "blue" :weight bold :underline t))
		("WAITING" .   (:foreground "orangered" :weight bold :underline t))
		))
;; 优先级醒目外观
(setq org-priority-faces
	  '((?A . (:foreground "magenta" :weight bold :underline t))
		(?B . (:foreground "orange" :weight bold :underline t))
		(?C . (:foreground "yellow" :weight bold  :underline t))
		(?D . (:foreground "lightpink" :weight bold  :underline t))
		))
;;设置gtd文件的路径
;;备注：需要C-h v一下org-agenda-files变量，并配置该变量的文件加载路径添加，保存之后会在custom-set-variables函数下面
;;生成该语句'(org-agenda-files (quote ("~/my-agenda")))，之后每次启动emacs，路径就能生效了
(defvar org-agenda-dir "" "gtd org files location")
(setq-default org-agenda-dir "~/.my-agenda")
(setq org-agenda-file-inbox (expand-file-name "inbox.org" org-agenda-dir))
(setq org-agenda-file-work (expand-file-name "work.org" org-agenda-dir))
(setq org-agenda-file-life (expand-file-name "life.org" org-agenda-dir))
(setq org-agenda-file-blogs (expand-file-name "blogs-task.org" org-agenda-dir))

(setq blogs-linux-active (expand-file-name "blogs-linux-active.org" org-agenda-dir))
(setq blogs-emacs-active (expand-file-name "blogs-emacs-active.org" org-agenda-dir))
(setq blogs-makefile-active (expand-file-name "blogs-makefile-active.org" org-agenda-dir))
(setq blogs-git-active (expand-file-name "blogs-git-active.org" org-agenda-dir))

(setq blogs-stm32f4-active (expand-file-name "blogs-stm32f4-active.org" org-agenda-dir))
(setq blogs-stm32f7-active (expand-file-name "blogs-stm32f7-active.org" org-agenda-dir))
(setq blogs-s3c2440-active (expand-file-name "blogs-s3c2440-active.org" org-agenda-dir))
(setq blogs-raspberry-pi-active (expand-file-name "blogs-raspberry-pi-active.org" org-agenda-dir))
(setq blogs-C-active (expand-file-name "blogs-C-active.org" org-agenda-dir))
(setq blogs-Cpp-active (expand-file-name "blogs-Cpp-active.org" org-agenda-dir))
(setq blogs-Mysql-active (expand-file-name "blogs-mysql-active.org" org-agenda-dir))
(setq blogs-qt-active (expand-file-name "blogs-qt-active.org" org-agenda-dir))
(setq blogs-tcp-ip-active (expand-file-name "blogs-tcp-ip-active.org" org-agenda-dir))
(setq org-agenda-files (list org-agenda-dir))


;;%a：创建gtd前光标所在文件的位置
;;%?：模板完成后最终光标所在位置
;;%U:时间戳
;;%i：Initial content, copied from the active region.  If %i is
;;indented, the entire inserted text will be indented as well
;;%^g:等待输入一个tag
;;\n:回车
;;\t:前进一个制表符
;;%[pathname]:将pathname路径下的该文件的内容复制到此处
;;%^{}：等待用户输入字符串
;;%^{标签|A|B|C|}：提供默认的A,以及可供用户选择的B和C
;;%^{language}:emacs承认的一种语言
;;%t:插入一个今天的日期，结合SCHEDULED关键字，可以很好的实现C-c C-s功能
;;-----------------------------标签Tags的原则-------------------------------------------
;;说明：
;;(1)Tags应当反应提条目的属性而不是状态;
;;(2)标签分为主标签和附标签:每个主标签后都可匹配若干副标签
;;    @Work:表示该条目是一个工作任务
;;    @Proj:表示该条目一个工程任务
;;    	@Emacs:表示该条目是一个emacs工程任务
;;      @Git:表示该条目是一个Git工程任务
;;      @Linux:表示该条目一个Linux工程任务
;;      @Makefile:表示该条目一个Linux工程任务
;;      @Stm32f4:表示该条目是一个stm32f4工程任务
;;      @Stm32f7:表示该条目是一个stm32f7工程任务
;;      @RaPi:表示该条目是一个树莓派工程任务
;;      @C：表示该条目是一个C相关的算法，数据结构等测试工程任务
;;      @C++：表示该条目是一个C++相关的测试工程任务  
;;		@QT:表示该条目是一个qt工程任务
;;		@Mysql:表示该条目是一个Mysql工程任务
;;      @TCP:表示该条目是一个TCP-IP协议栈工程任务
;;	  @Life:表示该条目是一个生活相关的任务
;;    @Jour:表示该条目是日记任务
;;	  @Blog:表示该条目是博客任务
;;添加标签：C-c  C-q
(setq org-capture-templates
      '(("i" "Inbox			想法收集器" entry (file+headline org-agenda-file-inbox "My-Inbox")
		 "* INBOX [#D] Theme:%^{}%? %^{标签|:@Work:|:@Life:|:@Blog:}\n\tSCHEDULED:%t\n\tCase creation time:%U %i\n"
		 :empty-lines 0)
		("t" "Work			工作相关的待办事项" entry (file+headline org-agenda-file-work "My-Work")
		 "* TODO [#A] Theme:%^{}%? :@Work:\n\tSCHEDULED:%t\n\t详情:略~\nCase creation time:%U %i\n"
		 :empty-lines 0)
		("l" "Life			生活相关的待办事项" entry (file+headline org-agenda-file-life "My-Life")
		 "* TODO [#B] Theme:%^{}%? :@Life:\n\tSCHEDULED:%t\n\t详情:略~\nCase creation time:%U %i\n"
		 :empty-lines 0)
		("p" "Blog-Task       计划要写的博客" entry (file+headline org-agenda-file-blogs "My-Blog-Task")
		 "* TODO [#C] Theme:%^{}%? :@Blog%[~/.emacs.d/snippets/org-capture-tags]\n\tSCHEDULED:%t\n\tLink position:%A\nCase creation time:%U %i\n"
		 :empty-lines 0)
		
		("b" "Blog			写博客")
		("ba" "blogs-linux				有关linux的博客" entry (file+headline blogs-linux-active "blogs-linux-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Linux:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bb" "blogs-emacs				有关emacs的博客" entry (file+headline blogs-emacs-active "blogs-emacs-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Emacs:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bc" "blogs-makefile            有关makefile的博客" entry (file+headline blogs-makefile-active "blogs-makefile-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Makefile:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bd" "blogs-git				    有关git的博客" entry (file+headline blogs-git-active "blogs-git-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Git:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("be" "blogs-stm32f4     		有关stm32f4的博客" entry (file+headline blogs-stm32f4-active "blogs-stm32f4-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Stm32f4:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bf" "blogs-stm32f7     		有关stm32f7的博客" entry (file+headline blogs-stm32f7-active "blogs-stm32f7-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Stm32f7:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bg" "blogs-s3c2440     		有关s3c2440的博客" entry (file+headline blogs-s3c2440-active "blogs-s3c2440-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@S3c2440:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bh" "blogs-raspberry-pi		有关树莓派的博客" entry (file+headline blogs-raspberry-pi-active "blogs-raspberry-pi-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@RaPi:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bi" "blogs-C    				有关C的博客" entry (file+headline blogs-C-active "blogs-C-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@C:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bj" "blogs-Cpp    				有关C++的博客" entry (file+headline blogs-Cpp-active "blogs-Cpp-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Cpp:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bk" "blogs-mysql    			有关mysql的博客" entry (file+headline blogs-mysql-active "blogs-mysql-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Mysql:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bl" "blogs-qt    				有关QT的博客" entry (file+headline blogs-qt-active "blogs-qt-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@Qt:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		("bm" "blogs-tcp-ip    			有关TCP-IP的博客" entry (file+headline blogs-tcp-ip-active "blogs-tcp-ip-active")
		 "* WAITTING [#D] Theme:%^{}%? :@Blog:@TCP:\n\tSCHEDULED:%t\n\nBlog creation time:%U %i\n"
		 :empty-lines 0)
		))

(setq org-agenda-custom-commands
      '(("p" . "------按任务优先级查询TODO事项---------TODO--------[A--B--C--D]------------")
		("pa" "------TODO--A------------" tags-todo "+PRIORITY=\"A\"") 
		("pb" "------TODO--B------------" tags-todo "+PRIORITY=\"B\"") 
		("pc" "------TODO--C------------" tags-todo "+PRIORITY=\"C\"") 
		("pd" "------TODO--D------------" tags-todo "+PRIORITY=\"D\"")
		
		("v" . "------按任务状态查询-------INBOX----TODO----DONE----ABORT----WAITING------")
		("vi" "-------INBOX-------------" tags "+TODO=\"INBOX\"")
		("vt" "-------TODO--------------" tags "+TODO=\"TODO\"")
		("vd" "-------DONE--------------" tags "+TODO=\"DONE\"")
		("va" "-------ABORT-------------" tags "+TODO=\"ABORT\"")
		("vw" "-------WAITING-----------" tags "+TODO=\"WAITTING\"")

		("z" . "------按任务优先级查询所有事项---------ALL--------[A--B--C--D]-------------")
		("za" "------TODO--A------------" tags "+PRIORITY=\"A\"") 
		("zb" "------TODO--B------------" tags "+PRIORITY=\"B\"") 
		("zc" "------TODO--C------------" tags "+PRIORITY=\"C\"") 
		("zd" "------TODO--D------------" tags "+PRIORITY=\"D\"")

		("g" . "------按大类任务标签查询---------@Work---------@Life--------@Blog---------")
		("gw" "-------@Work-------------" tags "+@Work")
		("gl" "-------@Life-------------" tags "+@Life")
		("gb" "-------@Blog-------------" tags "+@Blog")
		
		("x" . "------按小类任务标签查询--------@Linux----@Emacs  ...  @STM32----@TCP-----")
		("xa" "-------@Linux------------" tags "+@Linux")
		("xb" "-------@Emacs------------" tags "+@Emacs")
		("xc" "-------@Git--------------" tags "+@Git")
		("xd" "-------@Makefile---------" tags "+@Makefile")
		("xe" "-------@Stm32f4----------" tags "+@Stm32f4")
		("xf" "-------@Stm32f7----------" tags "+@Stm32f7")
		("xg" "-------@S3c2440----------" tags "+@S3c2440")
		("xh" "-------@RaPi-------------" tags "+@RaPi")
		("xi" "-------@C----------------" tags "+@C")
		("xj" "-------@Cpp--------------" tags "+@Cpp")
		("xk" "-------@Qt---------------" tags "+@Qt")
		("xl" "-------@Mysql------------" tags "+@Mysql")
		("xm" "-------@TCP--------------" tags "+@TCP")
		))

;;关闭其它窗口
(delete-other-windows)

;;如果一个任务既安排了开始时间又设定了截止时间，日程表上的提醒将有重复，可以选择显示哪个，忽略截止时间提醒
;;(setq org-agenda-skip-deadline-prewarning-if-scheduled t)

;; (setq-default org-refile-targets
;; 			  (quote
;; 			   (("inbox.org" :level . 1)
;; 				("work.org" :level . 1)
;; 				("life.org" :level . 1)
;; 				("blogs.org" :level . 1)
;; 				("blogs-linux-active.org" :level . 1)
;; 				("blogs-linux-arch-part1.org" :level . 1)
;; 				("blogs-linux-arch-part2.org" :level . 1)
;; 				("blogs-emacs-active.org" :level . 1)
;; 				("blogs-emacs-arch-part1.org" :level . 1)
;; 				("blogs-makefile-active.org" :level . 1)
;; 				("blogs-makefile-arch-part1.org" :level . 1)
;; 				("blogs-git-active.org" :level . 1)
;; 				("blogs-git-arch-part1.org" :level . 1)
;; 				("blogs-stm32f4-active.org" :level . 1)
;; 				("blogs-stm32f4-arch-part1.org" :level . 1)
;; 				("blogs-stm32f7-active.org" :level . 1)
;; 				("blogs-stm32f7-arch-part1.org" :level . 1)
;; 				("blogs-s3c2440-active.org" :level . 1)
;; 				("blogs-s3c2440-arch-part1.org" :level . 1)
;; 				("blogs-raspberry-pi-active.org" :level . 1)
;; 				("blogs-raspberry-pi-arch-part1.org" :level . 1)
;; 				("blogs-C.org-active" :level . 1)
;; 				("blogs-C-arch-part1.org" :level . 1)
;; 				("blogs-Cpp-active.org" :level . 1)
;; 				("blogs-Cpp-arch-part1.org" :level . 1)
;; 				("blogs-mysql-active.org" :level . 1)
;; 				("blogs-mysql-arch-part1.org" :level . 1)
;; 				("blogs-qt-active.org" :level . 1)
;; 				("blogs-qt-arch-part1.org" :level . 1)
;; 				("blogs-tcp-ip-active.org" :level . 1)
;; 				("blogs-tcp-ip-arch-part1.org" :level . 1))))




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



