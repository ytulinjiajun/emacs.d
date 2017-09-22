;;------------------------------------------------------------------
;; 开启 evil-leader
;;------------------------------------------------------------------ 
(global-evil-leader-mode)

(setq evil-leader/leader "SPC")

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "ss" 'swiper
  "sf" 'counsel-git
  "sp" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "wr" 'split-window-right
  "wb" 'split-window-below
  "wd" 'delete-other-windows
  "md" 'ljj/down-line-backp  
  "SPC" 'ace-jump-mode
  )    

(provide 'config-evil-leader-plugin)
