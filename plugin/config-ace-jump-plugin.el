(provide 'config-ace-jump-plugin)

(autoload 'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(define-key global-map (kbd "M-SPC") 'ace-jump-mode)

(autoload 'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t) 

;; (eval-after-load "ace-jump-mode"
;;   '(ace-jump-mode-enable-mark-sync))
;; (define-key global-map (kbd "M-SPC") 'ace-jump-mode-pop-mark)

