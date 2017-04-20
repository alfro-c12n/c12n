(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
    (package-initialize))


(windmove-default-keybindings)
(setq dired-dwim-target t)
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(ansi-term-color-vector
   [unspecified "#232c31" "#2a5491" "#237986" "#a03b1e" "#484d79" "#c59820" "#484d79" "#9ea7a6"])
 '(custom-enabled-themes (quote (base16-chalk)))
 '(custom-safe-themes
   (quote
    ("e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "3f546f127564de59f1c42dfd65d32bd7650fa5a614cd58c2df061da052ea3ec0" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" default)))
 '(indent-tabs-mode nil)
 '(standard-indent 4)
 '(tab-always-indent (quote complete))
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 102 106 110 114 118 122 126))))

(add-to-list 'load-path "~/.emacs.d/my_libs")
(load "php-mode.el")
(load "web-mode.el")
(require 'web-mode) (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))

(require 'web-mode) (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode)) (add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))

(require 'php-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; ;; (require 'php-mode)
;; ;; (custom-set-faces
;; ;;  ;; custom-set-faces was added by Custom.
;; ;;  ;; If you edit it by hand, you could mess it up, so be careful.
;; ;;  ;; Your init file should contain only one such instance.
;; ;;  ;; If there is more than one, they won't work right.
;; ;;  )

(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)

  ;; set indentation, can set different indentation level for different code type
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(defun remove-whitespaces-and-save ()
  "Removes trailing whitespaces and saves."
  (interactive)
  (whitespace-cleanup)
  (save-buffer)
)
(global-set-key (kbd "C-c s") 'remove-whitespaces-and-save)


;;; === MY MACROS ===
;;; Creates a 'TEARDOWN' function on a phpunit test based on its setUp function
(fset 'cool-teardown
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 115 101 116 85 112 27 79 72 0 19 112 117 98 108 105 99 19 27 79 72 27 119 13 27 79 65 13 27 79 65 25 18 115 101 116 85 112 0 27 91 49 59 53 67 23 116 101 97 114 68 111 110 127 119 110 27 79 66 0 19 112 117 98 108 105 99 27 79 72 18 125 27 79 72 27 120 108 105 110 101 9 127 127 127 127 127 127 127 127 127 127 127 127 127 127 127 127 107 101 9 101 112 9 13 92 36 116 104 105 115 45 62 46 42 32 61 13 0 19 112 117 98 108 105 99 27 79 72 18 125 27 79 72 27 120 114 101 112 108 97 99 101 45 114 101 103 101 120 112 13 92 40 92 36 116 104 105 115 45 62 46 42 92 41 32 61 32 127 92 40 46 42 92 41 13 186 127 92 49 32 61 32 110 117 108 108 59 13 13 9 103 99 95 99 111 108 108 101 99 116 95 99 121 99 108 101 115 40 41 59 13 9 112 97 114 101 109 116 127 127 110 116 58 58 116 101 97 114 68 111 119 110 40 41 59 24 19] 0 "%d")) arg)))

(global-set-key (kbd "C-c a") 'cool-teardown)
(global-set-key [C-tab] 'dabbrev-expand)
(put 'cool-teardown 'kmacro t)
;;; Changes the indenting to fully TAB indents.
(fset 'tab-indenting
   "\C-[<\C-[xreplace-string\C-m\C-q\C-i\C-m\C-m\C-[<\C-[xreplace-string\C-m    \C-m\C-m\C-[<\C-@\C-[>\C-i\C-[<\C-[xreplace-string\C-m    \C-m\C-q\C-i\C-m\C-[<")
(global-set-key (kbd "C-c q") 'tab-indenting)
(put 'tab-indenting 'kmacro t)
;;; === END MY MACROS ===
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun uuid-insert-random ()
  (interactive)
  (shell-command "uuidgen" t))
