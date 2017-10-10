;; 光标向左边移动一个单元格
(global-set-key [s-tab] (quote org-table-previous-field))

;; 在光标所在行的上面插入一个新行
(global-set-key [M-s-up] (quote org-table-insert-row))

;;在光标所在行的左边插入一个新列
(global-set-key [M-s-left] (quote org-table-insert-column))

;; 删除光标所在行
(global-set-key [M-s-down] (quote org-table-kill-row))

;; 删除光标所在列
(global-set-key [M-s-right] (quote org-table-delete-column))

(provide 'config-org-table-mode)
