(provide 'init-web-plugin)

;;该配置使得所有JavaScript文件都使用JavaScript-IDE打开而不是JavaScript-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;;该配置使得Javascript能够使用node-repl
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;配置web-mode的缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ;web-mode ,html tag 
  (setq web-mode-css-indent-offset 2)	 ;web-mode ,css
  (setq web-mode-code-indent-offset 2))	 ;web-mode ,js
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;;配置js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;配置js2-mode的语法检查
(add-hook 'js2-mode-hook 'flycheck-mode)
