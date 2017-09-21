;;---------------------------使用说明--------------------------------
;; 1. 匹配：M-s o
;;    将光标移动到待匹配的单词，按M-s o回车,会在右边缓冲区列举出所有在当前
;; buffer中匹配到该单词所在的条目
;;    任意位置按按M-s o，在小缓冲区提示输入匹配项，输入匹配项并回车，会在右边
;; 缓冲区列举出所有在当前buffer中
;; 2. 编辑：e
;;    在右边开启的缓冲区中，字母e,进入occur-edit编辑模式，C-c C-c完成编辑，
;; 并回退到occur-mode,q，
;; 3. 退出：q
;; 备注：
;;    occur-mode,提供了，（匹配，单一编辑），的功能；iedit提供了（匹配，标记）
;; 的功能(M-s e),标记，意味着“同时操作”，所以，二者结合，可以提供文件
;; (匹配，批量编辑)的功能
;;	  iedit提供了（匹配，标记）的功能,而dired-mode提供编辑(C-x q)的功能，所以
;; 二者的结合可以提供目录的(匹配，批量编辑)的功能
;;------------------------------------------------------------------ 


;;------------------------------------------------------------------
;; 增强occur-mode,使得在当前单词的位置按下M-s o时，可以自动抓取光标所在的
;; 单词，而不必手动输入
;;------------------------------------------------------------------
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
(global-set-key (kbd "M-s o") 'occur-dwim)

(provide 'config-occur-mode)
