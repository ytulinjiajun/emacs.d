;;------------------------------------------------------------------
;; 开启 evil-leader
;;------------------------------------------------------------------ 
(global-evil-leader-mode)

(setq evil-leader/leader "SPC")

(evil-leader/set-key
  "bs" 'switch-to-buffer
  "bq" 'kill-buffer
  "ss" 'swiper
  "sf" 'counsel-find-file
  "sg" 'counsel-git
  "sp" 'helm-do-ag-project-root
  "oa" 'org-agenda
  "oc" 'org-capture
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "wr" 'split-window-right
  "wb" 'split-window-below
  "wq" 'delete-windows
  "md" 'ljj/down-line-backp
  "ma" 'evil-first-non-blank
  "me" 'evil-end-of-line
  "SPC" 'ace-jump-mode
  "qq" 'save-buffers-kill-terminal
  )    

(provide 'config-evil-leader-plugin)
