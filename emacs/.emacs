(setq-default tab-width 4)


;; CoffeeScript

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)


;; Clojure
(add-to-list 'load-path "~/.emacs.d/vendor/clojure-mode")
(ignore-errors (require 'clojure-mode))
(ignore-errors (require 'clojure-test-mode))


;; Haskell
(load "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)