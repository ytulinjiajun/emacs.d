;;-------------------------------Dired Mode------------------------------------
;;创建文件夹： +		    删除文件夹： d  	         创建文件： C-x C-f
;;复制文件： C		    重命名文件： R		     移动文件到目录： R 
;;删除文件： d		    标记删除文件：D		     撤销标记： U
;;执行： X		        刷新： g                  退出： q
;;上一级目录：shift + 6  编辑模式： C-x C-q         完成编辑：C-c C-c 
;;-----------------------------------------------------------------------------
(require 'dired-x)    ;;产生一个快捷键C-x C-j,打开当前文件所在的dired

;;删除目录或复制目录时,总是默认递归删除或复制而不询问用户
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;;改善dired-mode的复制行为：同时在两个分屏上使用C-x C-j时，按下C(复制)，该配置将自动指明复制路径为另一个分屏所在路径 
(setq dired-dwim-target t)

;;禁止随意为文件重新开辟缓冲区
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'config-dired-mode)