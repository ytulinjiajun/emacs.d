;;------------------------------------------------------------------
;; >> t: 加载用户配置之后不再去加载default.el
;;------------------------------------------------------------------ 
(setq inhibit-default-init t)

;;------------------------------------------------------------------
;; >> nil 且 initial-buffer-choice 为nil： show startup screen
;; >> t: 抑制 startup screen 
;;------------------------------------------------------------------
(setq inhibit-startup-screen t)

;;------------------------------------------------------------------
;; >> t: 强制加载*scratch* buffer作为启动后的buffer
;; >> string: 通常是一个文件路径或者目录路径，启动后加载该文件
;; >> func: 函数，启动后调用该函数
;;------------------------------------------------------------------ 
(setq initial-buffer-choice t)

;;------------------------------------------------------------------ 
;; 配置 *scratch* 缓冲区中显示提示欢迎信息
;;------------------------------------------------------------------ 
(setq initial-scratch-message
			  ";; Happy hacking ※ linjiajun ❤ Emacs ※ ^_^ !

")

;;------------------------------------------------------------------
;; 将custom-file放到.emacs.d/lisp目录下
;;------------------------------------------------------------------ 
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))
(require 'init-custom)

(provide 'init-startup)