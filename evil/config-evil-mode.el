(evil-mode 1)
;;------------------------------------------------------------------
;; 该代码块可以将 insert state map 中的快捷键清空，使其可以回退到
;; Emacs State 中，这样我们之前的 Emacs State 里面定义的
;; C-w 等快捷键就不会被 evil insert minor mode state 所覆盖
;;------------------------------------------------------------------ 
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(require 'config-evil-leader-plugin)

(require 'config-evil-surround-plugin)

(provide 'config-evil-mode)
