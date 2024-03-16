(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-dark))
 '(package-selected-packages '(evil multiple-cursors magit omnisharp lsp-mode ##))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "gray30" :box (:line-width (1 . 1) :color "red") :family "Serif"))))
 '(tabbar-default ((t (:inherit variable-pitch :background "gray0" :foreground "gray75" :height 0.8))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "green"))))
 '(variable-pitch ((t (:family "Serif")))))

(setq omnisharp-server-executable-path "/opt/dotnet/omnisharp-roslyn/OmniSharp")

(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(global-display-line-numbers-mode)
(display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(setq-default tab-width 2)

;; c-mode settings
(setq c-default-style "linux"
      c-basic-offset 2
			indent-tabs-mode nil)


;; custom packages
(require 'multiple-cursors)
(require 'tabbar)
(require 'evil)
(require 'magit)

(tabbar-mode 1)
(global-auto-complete-mode t)

(defun single-tabbar-buffer-groups ()
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
              ((eq major-mode 'dired-mode) "emacs")
              (t "user"))))
(setq tabbar-buffer-groups-function 'single-tabbar-buffer-groups)

(global-set-key (kbd "<f11>") 'previous-buffer)
(global-set-key (kbd "<f12>") 'next-buffer)

(global-set-key (kbd "<f12>") 'next-buffer)

(keymap-global-set "C-c C-x" 'kill-region)
(keymap-global-set "C-c C-c" 'kill-ring-save)
(keymap-global-set "C-c C-v" 'yank)

(global-set-key (kbd "C-q") 'omnisharp-auto-complete)

(global-set-key (kbd "C-,") 'other-window)
(global-set-key (kbd "C-.") 'delete-window)

(global-set-key [(control shift iso-lefttab)] 'tabbar-backward-tab)
(global-set-key [(control tab)]       'tabbar-forward-tab)
