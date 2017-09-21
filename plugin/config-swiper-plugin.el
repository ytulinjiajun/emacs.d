;;该配置使得C-x b快捷键在切换缓冲区时，使用counsel插件，能在小缓冲区中更好的显示
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;; ----------------------------------------------快捷键--------------------------------------------------------
;; -----------------------------------------------------------------------------------------------------------
;;该配置使得按下M-x时，在小缓冲区中出现一个可预览的窗口并提供可选项(前提：安装了counsel和swiper插件)
(global-set-key (kbd "M-x") 'counsel-M-x)

;;该配置使得按下C-s快捷键进行文档内搜索时，在小缓冲区中出现一个可预览的窗口并提供可选项(前提：安装了counsel和swiper插件)
(global-set-key (kbd "C-s") 'swiper)

;;该配置使得按下C-x C-f快捷键执行“打开/新建”文件功能时，在小缓冲区中出现一个可预览的窗口并提供可选项(前提：安装了counsel和swiper插件)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;该配置使得按下C-h f快捷键执行“函数描述”操作时，在小缓冲区中出现一个可预览的窗口并提供可选项(前提：安装了counsel和swiper插件)
(global-set-key (kbd "C-h f") 'counsel-describe-function)

;;该配置使得按下C-h v快捷键执行“变量描述”操作时，在小缓冲区中出现一个可预览的窗口并提供可选项(前提：安装了counsel和swiper插件)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;该配置使得按下C-c g快捷键执行“查找git所管理的文件”的操作时，在小缓冲区中出现一个可预览的窗口并提供可选项(前提：安装了counsel和swiper插件)
(global-set-key (kbd "C-c g") 'counsel-git)

(provide 'config-swiper-plugin)
