;; Gnus setup for GMail

;; User information
(setq user-mail-address "Thomas Moulard")
(setq user-full-name "thomas.moulard@gmail.com")

;; Incoming mail
(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-authinfo-file "~/.dotfiles/.authinfo.gpg")
				  (nnimap-stream ssl)))

;; Outgoing mail
(setq send-mail-function 'smtpmail-send-it
      smtpmail-auth-credentials "~/.dotfiles/.authinfo.gpg"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
