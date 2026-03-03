;;; $DOOMDIR/packages.el -*- lexical-binding: t; -*-

;; =============================================================================
;; 1. UI & MODERN AESTHETICS
;; =============================================================================

(package! olivetti)
(package! org-modern)
(package! org-modern-indent :recipe (:host github :repo "jdtsmith/org-modern-indent"))
(package! org-appear)
(package! marginalia)

;; =============================================================================
;; 2. ADVANCED AGENDA & SEARCH
;; =============================================================================

(package! org-super-agenda)
(package! org-ql)

;; =============================================================================
;; 3. ORG-ROAM & VISUAL GRAPH
;; =============================================================================

(unpin! org-roam)
(package! org-roam-timestamps)
(package! websocket)
(package! org-roam-ui
  :recipe (:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))

;; =============================================================================
;; 4. TERMINAL & SYSTEM
;; =============================================================================

(package! vterm)
