;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugin" user-emacs-directory))

;;------------------------------------------------------------------
;; 定位配置文件所在目录
;;------------------------------------------------------------------
(defun open-my-config-dir ()
  (interactive)
  (find-file "~/.emacs.d"))
(global-set-key (kbd "<f2>") 'open-my-config-dir)

;;------------------------------------------------------------------
;; 设定默认工作目录
;;------------------------------------------------------------------
(setq default-directory "~/.emacs.d")

;;------------------------------------------------------------------
;; require plug-in
;;------------------------------------------------------------------ 
(require 'init-startup)

(require 'init-package-manage)

(require 'init-base-config)

(require 'init-key-binding)

;;------------------------------------------------------------------
;; require mode
;;------------------------------------------------------------------ 
(require 'config-org-mode)

(require 'config-dired-mode)

(require 'config-abbrev-mode)

(require 'config-show-paren-mode)

(require 'config-occur-mode)

(require 'config-imenu-mode)

