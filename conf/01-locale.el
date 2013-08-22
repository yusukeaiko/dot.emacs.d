; 日本語 info が文字化けしないように
(auto-compression-mode t)

;; Grep for Japanese
(if (file-exists-p "/usr/bin/lgrep")
    (setq grep-command "lgrep -n ")
)

;; Input method
(cond ((eq window-system 'w32))
      ((or (eq window-system 'ns) (eq window-system 'mac) (string-match "apple-darwin" system-configuration))
       (setq default-input-method "MacOSX"))
      ((string-match "linux" system-configuration)
       (require 'mozc)
       (setq default-input-method "japanese-mozc")
       (setq mozc-candidate-style 'overlay)
       (setq mozc-candidate-style 'echo-area))  ;複数行で変換候補を表示
      )
