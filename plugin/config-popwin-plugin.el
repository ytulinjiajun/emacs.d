;;该配置使得光标能根据实际情况实时动态的在buffer中切换(备注：popwin默认是在底部打开窗口，应当customize-groups一下popwin修改为右边)
(require 'popwin)
(popwin-mode t)

;; (setq-default popwin:popup-window-position (quote right))
;; (setq-default popwin:popup-window-width 60)

(provide 'config-popwin-plugin)
