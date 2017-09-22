(provide 'init-package-manage)
;;注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;;cl - Common Lisp Extension
;;一个 Common Lisp 库，提供下面使用到的loop for pkg in之类的语法
(require 'cl)

;;包管理器
;;安装包：在该函数中添加对应package的名字即可,重启emacs后会自动暗装
;;删除包：从该函数中去除对应package的名字，然后M-x:package-autoremove，即可删除
(defvar linjiajun/packages '(
							 monokai-theme
							 company
							 hungry-delete
							 swiper
							 counsel
							 smartparens
							 popwin
							 ace-jump-mode
							 expand-region
							 iedit
							 helm-ag
							 sr-speedbar
							 org-pomodoro
							 window-numbering
							 which-key
							 evil
							 evil-leader
							 evil-surround
							 evil-nerd-commenter
							 youdao-dictionary
							 ) "Default packages")

;;当运行package-autoremove时，会去检查package-selected-packages这个变量的值，
;;不在该变量里面的package将会被删除
(setq package-selected-packages linjiajun/packages)

(defun linjiajun/packages-installed-p ()
  (loop for pkg in linjiajun/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (linjiajun/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg linjiajun/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 插件加载
(require 'config-monokai-theme-plugin)

(require 'config-company-plugin)

(require 'config-hungry-delete-plugin)

(require 'config-swiper-plugin)

(require 'config-smartparens-plugin)

(require 'config-popwin-plugin)

(require 'config-expand-region-plugin)

(require 'config-iedit-plugin)

(require 'config-helm-ag-plugin)

(require 'config-ace-jump-plugin)

(require 'config-which-key-plugin)

(require 'config-sr-speedbar-plugin)

(require 'config-window-numbering-plugin)

(require 'config-youdao-dictionary-plugin)
