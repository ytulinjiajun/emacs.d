;; 开启evil-mode
(evil-mode t)
;;------------------------------------------------------------------
;; 该代码块可以将 insert state map 中的快捷键清空，使其可以回退到
;; Emacs State 中，这样我们之前的 Emacs State 里面定义的
;; C-w 等快捷键就不会被 evil insert minor mode state 所覆盖
;;------------------------------------------------------------------ 
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;------------------------------------------------------------------
;; 该配置设置emacs启动的默认状态是emacs:
;;------------------------------------------------------------------
;; (setq evil-default-state 'emacs)

;;------------------------------------------------------------------
;; 该配置改善occur-mode下面无法使用evil的问题 
;;------------------------------------------------------------------
(add-hook 'occur-mode-hook
		  (lambda ()
			(evil-add-hjkl-bindings occur-mode-map 'emacs
			  (kbd "/") 'evil-search-forward
			  (kbd "n") 'evil-search-next
			  (kbd "N") 'evil-search-previous
			  (kbd "C-d") 'evil-scroll-down
			  (kbd "C-u") 'evil-scroll-up)))  

(require 'config-evil-leader-plugin)

(require 'config-evil-surround-plugin)

(require 'config-evil-nerd-commenter)

(provide 'config-evil-mode)
