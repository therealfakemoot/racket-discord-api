#lang info

(define name "discord-api")
(define version "0.0.0")
(define homepage "https://github.com/jcmdln/racket-discord-api")
(define primary-file "main.rkt")
(define blurb
  (list
   `(p "Racket bindings for the "
       (a ((href "https://discordapp.com")) "Discord")
       "API")))

(define categories
  '(api
    http))

(define deps
  '("base"
    "rfc6455"))