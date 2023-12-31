(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-dark))
 '(package-selected-packages '(multiple-cursors magit omnisharp lsp-mode ##))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

;; custom packages
(require 'multiple-cursors)
(require 'tabbar)

(tabbar-mode 1)


(defun single-tabbar-buffer-groups ()
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
              ((eq major-mode 'dired-mode) "emacs")
              (t "user"))))
(setq tabbar-buffer-groups-function 'single-tabbar-buffer-groups)

(global-set-key (kbd "<f11>") 'previous-buffer)
(global-set-key (kbd "<f12>") 'next-buffer)

(global-set-key (kbd "C-q") 'omnisharp-auto-complete)

(global-set-key [(control shift iso-lefttab)] 'tabbar-backward-tab)
(global-set-key [(control tab)]       'tabbar-forward-tab)

