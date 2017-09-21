;;高亮两边括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;高亮显示当前光标两边的括号(支持24/25版本)
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it))))

(provide 'config-show-paren-mode)
