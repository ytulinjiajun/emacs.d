;;------------------------------------------------------------------
;; 开启 evil-leader
;;------------------------------------------------------------------ 
(global-evil-leader-mode)

(setq evil-leader/leader "SPC")

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  )

(provide 'config-evil-leader-plugin)
