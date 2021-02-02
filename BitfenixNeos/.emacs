;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Melpa ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives
      '(
	("melpa" . "https://stable.melpa.org/packages/")
;	("melpa" . "https://melpa.org/packages/")
;	("gnu" . "http://elpa.gnu.org/packages/")
;	("marmalade" . "http://marmalade-repo.org/packages/")
	)
      )
(package-initialize)
(require 'linum)
(require 'ein)
(require 'dashboard)
(require 'multiple-cursors)
(require 'magit)
(require 'telephone-line)
(require 'page-break-lines)
(require 'all-the-icons)
(require 'ox-reveal)
(require 'tex)
(require 'ispell)
(require 'treemacs)
(require 'autopair)
;(require 'csharp-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; General ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'ivy-youtube "ivy-youtube" nil t)
(global-set-key (kbd "C-c y") 'ivy-youtube)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode 1)
(ido-mode 1)
(ivy-mode 1)
(flyspell-mode 1)
(autopair-global-mode)
(telephone-line-mode 1)
(global-flycheck-mode 1)
(global-auto-complete-mode 1)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(set-keyboard-coding-system nil)
(setq-default cursor-type 'bar)
(setq ispell-dictionary "greek")
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq ring-bell-function 'my-bell-function)
(setq make-backup-files 1)
(setq auto-save-default nil)
(setq scroll-step 1)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq vc-follow-symlinks nil)
(setq auto-mode-alist
      (append
       '(("\\.pl\\'" . prolog-mode)
	 ("\\.py\\'" . python-mode))
       auto-mode-alist))
;  (unless (memq this-command
;		'(isearch-abort abort-recursive-edit exit-minibuffer
;				keyboard-quit mwheel-scroll down up next-line previous-line
;				backward-char forward-char))
;    (ding)))
;;;;;;;;;;;;;;;;;;;;;;;;;;; Dashboard ;;;;;;;;;;;;;;;;;;;;;;;;;;
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Emacs is the ground. We run around and act silly on top of it, and when we die, may our remnants grace its ongoing incrementation.")
(setq dashboard-startup-banner "~/Pictures/Wallpapers/icons/keyboard.png")
(setq dashboard-set-heading-icons t)
(setq dashboard-set-init-info nil)
(setq dashboard-center-content t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-set-footer t)
(setq show-week-agenda-p t)
;(setq dashboard-org-agenda-categories '("Tasks" "Appointments"))
;;;;;;;;;;;;;;;;;;;;;;;;;;; Treemacs ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(treemacs-resize-icons 15)
(treemacs-follow-mode t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;; LaTeX ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun latex-compile ()
    (interactive)
    (save-buffer)
    (TeX-command "LaTeX" 'TeX-master-file))
(setq TeX-view-program-selection '((output-pdf "Zathura")))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq reftex-plug-into-AUCTeX t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(TeX-global-PDF-mode t)
(eval-after-load 'latex
    '(define-key LaTeX-mode-map (kbd "C-c C-x") 'latex-compile))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; General Keybinds ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd"C-x c") 'compile)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-:") 'shrink-window)
(global-set-key (kbd "C-\"") 'enlarge-window)
(global-set-key (kbd "M-[") 'hs-show-block)
(global-set-key (kbd "M-]") 'hs-hide-block)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper)
(global-set-key (kbd "C-x C-e") 'eshell)
(global-set-key (kbd "C-x x") 'shell-command)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x C-j") 'flyspell-auto-correct-previous-word)
(global-set-key (kbd "C-x C-k") 'ispell-change-dictionary)
(global-set-key (kbd "C-<tab>") 'treemacs)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; General Macros  ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Org Mode  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-files (list
			"~/Documents/Org/Agenda.org"
			"~/Documents/Org/Notes.org"))
(setq org-reveal-root "file:///home/dimitris/.emacs.d/reveal.js")
(add-hook 'org-mode-hook
	  (lambda()
	    (org-bullets-mode t)
	    (flyspell-mode 1)))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Python ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'elpy-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Python Keybinds ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; Python Macros ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; C++ Keybinds ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd"C-x ppcmain") 'cpp-main)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; C++ Macros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'cpp-main
   [?# ?i ?n ?c ?l ?u ?d ?e ?  ?< ?i ?o ?s ?t ?r ?e ?a ?m ?> return return ?i ?n ?t ?  ?m ?a ?i ?n ?\( ?\) ?\{ return return ?r ?e ?t ?u ?r ?n ?  ?0 ?\; return return ?\}])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; Java Keybinds ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd"C-x jclass") 'java-class)
(global-set-key (kbd"C-x jmain") 'java-main)
(global-set-key (kbd"C-x jpl") 'java-println)
(global-set-key (kbd"C-x jpr") 'java-print)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; Java Macros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'java-class
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([112 117 98 108 105 99 32 99 108 97 115 115 32 123 125 2 return return return 16 16 return 47 47 32 65 116 116 114 105 98 117 116 101 115 return 47 47 32 69 110 100 32 65 116 116 114 105 98 117 116 101 115 return return 47 47 32 67 111 110 115 116 114 117 99 116 111 114 115 return 47 47 32 69 110 100 32 67 111 110 115 116 114 117 99 116 111 114 115 return return 47 47 32 77 101 116 104 111 100 115 return 47 47 32 69 110 100 32 77 101 116 104 111 100 115 16 16 16 16 16 16 16 16 16 2] 0 "%d")) arg)))

(fset 'java-main
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([112 117 98 108 105 99 32 115 116 97 116 105 99 32 118 111 105 100 32 109 97 105 110 40 83 116 114 105 110 103 91 93 32 97 114 103 115 41 123 125 2 return return return 16 16 return] 0 "%d")) arg)))

(fset 'java-println
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("System.out.println();\"\"" 0 "%d")) arg)))

(fset 'java-print
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("System.out.print();\"\"" 0 "%d")) arg)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(ansi-term-color-vector
   [unspecified "#1e1f29" "#ff5c57" "#5af78e" "#f3f99d" "#57c7ff" "#ff6ac1" "#57c7ff" "#eff0eb"] t)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes '(humanoid-light))
 '(custom-safe-themes
   '("99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "ddd5045ceb90356295b99a4da14200604bfc1dd658a3af568bd8a9961a5c4e5f" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "123a8dabd1a0eff6e0c48a03dc6fb2c5e03ebc7062ba531543dfbce587e86f2a" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "e1d09f1b2afc2fed6feb1d672be5ec6ae61f84e058cb757689edb669be926896" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "732ccca2e9170bcfd4ee5070159923f0c811e52b019106b1fc5eaa043dff4030" "0961d780bd14561c505986166d167606239af3e2c3117265c9377e9b8204bf96" "2679db166117d5b26b22a8f12a940f5ac415d76b004de03fcd34483505705f62" "8ca8fbaeaeff06ac803d7c42de1430b9765d22a439efc45b5ac572c2d9d09b16" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" "229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "37148381b35916d717945f3d0e1b2beb23c8b8383e5a7a879f1eaa4dde01d026" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "cb96a06ed8f47b07c014e8637bd0fd0e6c555364171504680ac41930cfe5e11e" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "8343be3a733414342075a9a42c6fa1ee9f64c2af179e5fec68febba34f05bd06" "af6d045e678f37d548bad4829c09e4ee57841fb0fc94138cbee3a49ec8417177" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "7c4cfa4eb784539d6e09ecc118428cd8125d6aa3053d8e8413f31a7293d43169" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "3e3a1caddeee4a73789ff10ba90b8394f4cd3f3788892577d7ded188e05d78f4" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "d5f8099d98174116cba9912fe2a0c3196a7cd405d12fa6b9375c55fc510988b5" "a339f231e63aab2a17740e5b3965469e8c0b85eccdfb1f9dbd58a30bdad8562b" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "65f35d1e0d0858947f854dc898bfd830e832189d5555e875705a939836b53054" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "ecfd522bd04e43c16e58bd8af7991bc9583b8e56286ea0959a428b3d7991bbd8" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "7220c44ef252ec651491125f1d95ad555fdfdc88f872d3552766862d63454582" "a61109d38200252de49997a49d84045c726fa8d0f4dd637fce0b8affaa5c8620" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "0e8bac1e87493f6954faf5a62e1356ec9365bd5c33398af3e83cfdf662ad955f" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "57f95012730e3a03ebddb7f2925861ade87f53d5bbb255398357731a7b1ac0e0" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(fci-rule-color "#3E4451")
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-todo-keyword-faces
   '(("TODO" . "#ba29eb")
     ("NEXT" . "#ba29eb")
     ("THEM" . "#08a7b3")
     ("PROG" . "#00bfa5")
     ("OKAY" . "#006fd7")
     ("DONT" . "#ff3d00")
     ("FAIL" . "#b0151a")
     ("DONE" . "#22a54e")
     ("NOTE" . "#ffb627")
     ("KLUDGE" . "#fb6107")
     ("HACK" . "#4d10a5")
     ("TEMP" . "#7a7b75")
     ("FIXME" . "#ba29eb")
     ("DEPRECATED" . "#ff3d00")
     ("REVIEW" . "#b27701")
     ("XXX" . "#4d10a5")
     ("XXXX" . "#4d10a5")
     ("\\?\\?\\?+" . "#4d10a5")))
 '(ivy-youtube-key "AIzaSyCrZmtIUpleJ_cou0ckI2XCm7te6xIEvSw")
 '(ivy-youtube-play-at "mpv")
 '(jdee-db-active-breakpoint-face-colors (cons "#0F1019" "#D85F00"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0F1019" "#79D836"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0F1019" "#767676"))
 '(jdee-server-dir "~/lib")
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(objed-cursor-color "#D83441")
 '(org-agenda-files '("~/Documents/Org/Notes.org"))
 '(package-selected-packages
   '(gruvbox-theme humanoid-themes ample-theme haskell-emacs-base autopair csharp-mode pip-requirements dashboard mozc-temp ac-mozc treemacs color-theme-sanityinc-tomorrow solarized-theme hexo haskell-mode flymd ein pynt ivy-youtube nofrils-acme-theme intero flyspell-correct auto-complete-auctex auctex latex-extra launch latex-preview-pane ox-reveal htmlize org-bullets all-the-icons doom-themes telephone-line nyan-mode magit multiple-cursors auto-virtualenv poly-R git ivy swiper flymake-racket flymake-python-pyflakes ipython-shell-send folding snazzy-theme company spacemacs-theme web-mode-edit-element web show-css linum-relative hlinum function-args flycheck-irony elpy edit-server dracula-theme css-eldoc css-comb css-autoprefixer cff auto-complete-c-headers atom-one-dark-theme ac-html-csswatcher ac-html-bootstrap ac-html-angular ac-html ac-anaconda))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(rustic-ansi-faces
   ["#0D0E16" "#D83441" "#79D836" "#D8B941" "#3679D8" "#8041D8" "#36D8BD" "#CEDBE5"])
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#0D0E16")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (list
    (cons 20 "#79D836")
    (cons 40 "#98cd39")
    (cons 60 "#b8c33d")
    (cons 80 "#D8B941")
    (cons 100 "#d89b2b")
    (cons 120 "#d87d15")
    (cons 140 "#D85F00")
    (cons 160 "#ba5548")
    (cons 180 "#9d4b90")
    (cons 200 "#8041D8")
    (cons 220 "#9d3ca5")
    (cons 240 "#ba3873")
    (cons 260 "#D83441")
    (cons 280 "#bf444e")
    (cons 300 "#a7555b")
    (cons 320 "#8e6568")
    (cons 340 "#767676")
    (cons 360 "#767676")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;
(put 'narrow-to-region 'disabled nil)
