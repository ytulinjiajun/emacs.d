(require 'yafolding)
;; (define-key yafolding-mode-map (kbd "<C-S-return>") nil)
;; (define-key yafolding-mode-map (kbd "<C-M-return>") nil)
;; (define-key yafolding-mode-map (kbd "<C-return>") nil)
;; (define-key yafolding-mode-map (kbd "C-c <C-M-return>") 'yafolding-toggle-all)
(define-key yafolding-mode-map (kbd "C-c v") 'yafolding-hide-parent-element)
(define-key yafolding-mode-map (kbd "C-c C-v") 'yafolding-toggle-element)

(add-hook 'makefile-gmake-mode-hook
		  (lambda () (yafolding-mode)))

(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))
;; (global-set-key (kbd "C-c v") 'yafolding-hide-parent-element)
(provide 'config-yafolding-plugin)
