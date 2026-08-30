;;; Elpaca package manager ;;;
(defvar elpaca-installer-version 0.12)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-sources-directory (expand-file-name "sources/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca-activate)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-sources-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;;; Install elpaca use-package support
(elpaca elpaca-use-package
  ;;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

;;; Install org mode
(elpaca org)

;;; Paranthesies
(electric-pair-mode t)

;;; Enable line numbers
(global-display-line-numbers-mode t)

;; Enable which key
(setq which-key-idle-delay 0.01)
(which-key-mode 1)

;;; Theme
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))

;;; Modeline
(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :after nerd-icons
  :hook (elpaca-after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-height 25     ; Sets modeline height
        doom-modeline-bar-width 4   ; Sets right bar width
        doom-modeline-icon t))

;;; Autocomplete
;; TAB key: fix indentation if needed, otherwise perform completion
(setq tab-always-indent 'complete)

(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :custom
  (corfu-cycle t) ; cycle around to first entry after reaching the last
  (corfu-preview-current nil) ; don't expand text at point until I press return
  (corfu-min-width 20)
  (corfu-on-exact-match 'insert) ; complete if there is only a single candidate
  (corfu-quit-no-match t)
  (corfu-quit-at-boundary t)
  :config
  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation next to completions

  ;; sort by input history
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history))
  )


;;; Magit and transient
(elpaca (transient :branch "main"))
(use-package magit
  :ensure t)

;;; Sublimity
(use-package sublimity
  :ensure t
  :config
  (sublimity-mode 1))

;;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;;; Enable smooth, line-by-line scrolling in terminal/TTY
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq scroll-margin 0)
(setq redisplay-dont-pause t)
(setq fast-but-imprecise-scrolling nil)
