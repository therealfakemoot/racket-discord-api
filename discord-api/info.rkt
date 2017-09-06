#lang setup/infotab

(define name "discord-api")
(define blurb
  (list
   `(p "Racket bindings for the "
       (a ((href "https://discordapp.com")) "Discord")
       "API")))
(define homepage "https://github.com/jcmdln/racket-discord-api")
(define primary-file "main.rk")
(define categories '(api http))

(define deps '("base" "rfc6455"))
