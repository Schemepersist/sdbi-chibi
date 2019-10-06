;; Opaque object types:

;; chain, connection, statement, result-set

(define-record-type DB-Chain
    (make-db-chain foo)
    db-chain?
  (foo db-chain:foo db-chain:set-foo!))

#|
(define-record-type DB-Connection
    (make-db-connection foo)
    db-connection?
  (foo db-connection:foo db-connection:set-foo!))

(define-record-type DB-Statement
    (make-db-statement foo)
    db-statement?
  (foo db-statement:foo db-statement:set-foo!))

(define-record-type DB-Result-set
    (make-db-result-set foo)
    db-result-set?
  (foo db-result-set:foo db-result-set:set-foo!))
|#


(define (db-chain-construct alist)
  (make-db-chain 42))

(define (db-chain-dismantle chain)
  #f) ;; undefined

;; (define (db-chain-adjust chain alist) -> undefined

#|
(db-connection-open chain alist) -> connection

(db-connection? obj) -> boolean

(db-connection-close connection) -> undefined
|#
