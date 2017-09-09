#lang racket/base

(require
  net/url
  racket/string
  rfc3339-old
  json)

(define (ParseTimeStamp t)
  parse-rfc3339-string t)

( struct RESTError
  (Request
   Response
   ResponseBody
   Message))

(define (Error)
  (string-append "HTTP " RESTError-Request ", " RESTError-ResponseBody))

(define (newRestError req resp body)
  (let ([err (RESTError req resp body (hash-ref (read-json body) "message"))]) err))
