;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; =============================================================================
;; 1. IDENTITY & DIRECTORIES
;; =============================================================================

(setq user-full-name "fvnky"
      user-mail-address "john@doe.com")

(setq default-directory "~/Documents/org/")
(setq org-directory "~/Documents/org/")
(setq org-roam-directory (file-truename "~/Documents/org/"))

;; This ensures ALL .org files in your directory (and subdirs) are tracked automatically
(defun my/reload-org-agenda-files ()
  (setq org-agenda-files (directory-files-recursively org-directory "\\.org$")))

;; Refresh the list every time you open the agenda
(add-hook 'org-agenda-pre-command-hook #'my/reload-org-agenda-files)

;; Initialize once on startup
(my/reload-org-agenda-files)

;; =============================================================================
;; 2. FONTS & THEME
;; =============================================================================

(setq doom-theme 'doom-tokyo-night)

;; Main UI and Code (Regular)
(setq doom-font (font-spec :family "Ellograph CF" :size 18 :weight 'regular))

;; Special/Normal Text (Regular Italic)
(setq doom-variable-pitch-font (font-spec :family "Ellograph CF" :size 18 :weight 'regular :slant 'italic))

;; =============================================================================
;; 3. UI & SYSTEM SETTINGS
;; =============================================================================

;; Shell Configuration
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell "/opt/homebrew/bin/fish")
(setq-default explicit-shell-file-name "/opt/homebrew/bin/fish")

;; Frame & Titlebar
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(setq ns-use-proxy-icon nil)

;; Editor Behavior
(setq-default tab-width 2)
(setq display-line-numbers-type 'relative)
(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook #'org-indent-mode)

;; Centered Layout (Olivetti)
(use-package! olivetti
  :hook (org-mode . olivetti-mode)
  :config
  (setq olivetti-body-width 0.5)) ; 50% screen width

(use-package! org-modern-indent
  :hook (org-mode . org-modern-indent-mode)
  :config
  (setq org-modern-indent-line-prefix "│ ")) ; Use a subtle vertical line for indentation

;; =============================================================================
;; 4. FILE MANAGEMENT
;; =============================================================================

(use-package! marginalia
  :config
  (marginalia-mode))

(use-package! dirvish
  :config
  (dirvish-override-dired-mode)
  (setq dirvish-sidebar-width 35
        dirvish-attributes '(file-size vc-state git-msg icons)
        dirvish-mode-line-format '(:left (sort symlink) :right (omit yank index)))
  (map! :leader
        :desc "Dirvish Sidebar" "o p" #'dirvish-side
        :desc "Dirvish Project" "o P" #'dirvish-dispatch))

;; =============================================================================
;; 5. ORG-MODE CORE & STYLING
;; =============================================================================

(setq org-log-done 'time
      org-log-into-drawer t
      org-enforce-todo-dependencies t
      org-fontify-done-headline t
      org-auto-align-tags nil
      org-tags-column 0
      org-catch-invisible-edits 'show-and-error
      org-special-ctrl-a/e t
      org-insert-heading-respect-content t
      org-hide-emphasis-markers t
      org-pretty-entities t
      org-agenda-tags-column 0
      org-ellipsis "…")

(custom-set-faces!
  ;; 1. Metadata (Regular Italic)
  `(org-todo :inherit variable-pitch :weight regular :slant italic :foreground ,(doom-color 'dark-green))
  `(org-priority :inherit variable-pitch :weight regular :slant italic :foreground ,(doom-color 'orange))
  '(org-date :inherit variable-pitch :weight thin :slant italic)
  '(org-special-keyword :inherit variable-pitch :weight thin :slant italic)

  ;; 2. HEADLINES (All Green, Standard Height)
  `(org-document-title :inherit fixed-pitch :weight bold :height 1.4 :foreground ,(doom-color 'green))
  `(org-level-1 :inherit fixed-pitch :weight bold :slant normal :height 1.0 :foreground ,(doom-color 'dark-green))
  `(org-level-2 :inherit fixed-pitch :weight bold :slant normal :height 1.0 :foreground ,(doom-color 'dark-green))
  `(org-level-3 :inherit fixed-pitch :weight bold :slant normal :height 1.0 :foreground ,(doom-color 'dark-green))
  `(org-level-4 :inherit fixed-pitch :weight bold :slant normal :height 1.0 :foreground ,(doom-color 'dark-green))
  `(org-level-5 :inherit fixed-pitch :weight bold :slant normal :height 1.0 :foreground ,(doom-color 'dark-green))

  ;; 3. DONE Task Styling
  `(org-headline-done :inherit fixed-pitch :weight regular :slant normal :strike-through t :foreground ,(doom-color 'comments))
  `(org-done :inherit variable-pitch :weight regular :slant italic :foreground ,(doom-color 'comments))
  `(org-modern-done :inherit fixed-pitch :foreground ,(doom-color 'comments) :weight regular)
  `(org-modern-symbol :foreground ,(doom-color 'comments))
  `(org-modern-star :foreground ,(doom-color 'comments))

  ;; 4. Technical Elements
  '(org-table :inherit fixed-pitch :weight regular :slant normal)
  '(org-code :inherit fixed-pitch :weight regular :slant normal)
  '(org-block :inherit fixed-pitch :weight regular :slant normal)
  '(org-checkbox :inherit fixed-pitch :weight regular :slant normal)
  `(org-modern-symbol :inherit fixed-pitch :weight regular :slant normal :foreground ,(doom-color 'dark-green)))

;; =============================================================================
;; 6. ORG-MODE PLUGINS (MODERN & APPEAR)
;; =============================================================================

(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("◉" "○" "◈" "◇" "⁖")
        org-modern-table nil
        org-modern-todo nil
        org-modern-priority nil
        org-modern-timestamp nil))

(use-package! org-modern-indent
  :hook (org-mode . org-modern-indent-mode))

(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autolinks t
        org-appear-autoentities t
        org-appear-autosubmarkers t
        org-appear-trigger 'manual))

;; =============================================================================
;; 7. ORG-AGENDA & REFILING
;; =============================================================================

(setq org-agenda-window-setup 'other-window
      org-agenda-span 'day
      org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm
      org-refile-targets '((nil :maxlevel . 3)
                           (org-agenda-files :maxlevel . 3)))

(set-popup-rule! "^\\*Org Agenda" :side 'right :size 0.4 :select t :quit nil)

(use-package! org-super-agenda
  :after org-agenda
  :init
  (org-super-agenda-mode)
  :config
  (setq org-super-agenda-header-map (make-sparse-keymap))
  (setq org-super-agenda-groups
        '((:name "󰃶 Schedule" :time-grid t)
          (:name " Active Projects" :todo "PROJ" :tag "project")
          (:name "󰶼 Crit" :priority "A")
          (:name "󰄿 Med" :priority "B")
          (:name "󰅃 Low" :priority "C")
          (:name " Unprocessed" :file-path "inbox.org"))))

(defun my/org-agenda-maybe-redo ()
  "Refresh the agenda if it is currently displayed."
  (when (get-buffer "*Org Agenda*")
    (save-window-excursion
      (with-current-buffer "*Org Agenda*"
        (org-agenda-redo t)))))

(add-hook 'after-save-hook #'my/org-agenda-maybe-redo)

;; =============================================================================
;; 8. ORG-ROAM
;; =============================================================================

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start nil))

(use-package! org-roam-timestamps
  :after org-roam
  :config
  (org-roam-timestamps-mode))

(after! org-roam
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
           "* %?"
           :if-new (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%A, %e %B %Y>\n#+category: Journal\n")))))

;; This configures SPC X (regular org-capture) to also use your daily note
(setq org-capture-templates
      '(("t" "todo" entry
         (file (lambda () (expand-file-name (format-time-string "daily/%Y-%m-%d.org") org-roam-directory)))
         "* TODO %?"
         :prepend t)
        ("j" "journal" entry
         (file (lambda () (expand-file-name (format-time-string "daily/%Y-%m-%d.org") org-roam-directory)))
         "* [%<%H:%M>] %? :journal:"
         :prepend t)))

;; =============================================================================
;; 9. KEYBINDINGS
;; =============================================================================

(map! :leader
      :desc "Today's Journal" "d" #'org-roam-dailies-goto-today
      :desc "Agenda Dashboard" "A" (lambda () (interactive) (org-agenda nil "a"))
      :desc "Toggle Centered Layout" "t o" #'olivetti-mode)

(map! :map org-agenda-mode-map
      :localleader
      :prefix ("v" . "View")
      "d" #'org-agenda-day-view
      "w" #'org-agenda-week-view
      "m" #'org-agenda-month-view
      "y" #'org-agenda-year-view)
