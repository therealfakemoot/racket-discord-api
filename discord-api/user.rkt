#lang racket

(require "endpoints.rkt")

(struct User
  (ID
   Email
   Username
   Avatar
   Discriminator
   Token
   Verified
   MFAEnabled
   Bot))

(define (String User-Username User-Discriminator)
  (string-append User-Username "#" User-Discriminator))

(define (Mention User-ID)
  (string-append "<@" User-ID ">"))

(define (AvatarURL size)
  (define URL "")
  (cond
    [(string-prefix? User-Avatar "a_")
     (let ([URL (EndpointUserAvatarAnimated User-ID User-Avatar)]) URL)]
    [(let ([URL (EndpointUserAvatar User-ID User-Avatar)]) URL)]))