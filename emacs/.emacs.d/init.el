; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (2048-game helm ranger nlinum-relative evil-surround use-package company evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; show-paren
(show-paren-mode 1)
(setq show-paren-delay 0)

;; evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; origami-mode
(global-origami-mode)

;; flycheck
(use-package flycheck
  :ensure t
  :config (setq flycheck-flake8-maximum-line-length 140)
  :init (global-flycheck-mode))

;; elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(setq elpy-rpc-python-command "/usr/bin/python3")

;; company-mode everywhere
(add-hook 'after-init-hook 'global-company-mode)

;; relative line numbers
(require 'nlinum-relative)
(nlinum-relative-setup-evil)                      ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)          ;; delay
(setq nlinum-relative-current-symbol "")        ;; "" for display current line number. Can be any string
(setq nlinum-relative-offset 0)

;; helm autocomplete
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x /") #'helm-swoop)

(helm-autoresize-mode 1)
(helm-mode 1)

;; evil-snipe
(evil-snipe-mode 1)
(evil-snipe-override-mode 1)
(setq evil-snipe-enable-incremental-highlight nil)
(setq evil-snipe-scope 'whole-buffer)

;; atomic-chrome
(atomic-chrome-start-server)

;; proselint
(defun proselint ()
  (interactive)
  (flycheck-mode)
  (flycheck-select-checker 'proselint))

;; which-key
(which-key-mode)
(which-key-setup-side-window-right-bottom)

;; sphinx-doc
(add-hook 'python-mode-hook (lambda ()
    (require 'sphinx-doc)
    (sphinx-doc-mode t)))

(provide 'init)
;;; init.el ends here
