;; Opaque object types, chain, connection, statement, and result-set

(define-library (srfi sdbi records)
  (export

    make-db-chain db-chain?
    db-chain:connection-open-proc db-chain:connection-close-proc



    make-invoker
    )

  (import (scheme base))

  (begin

    (define-record-type DB-Chain
      (make-db-chain connection-open-proc
                     connection-close-proc
                     )
        db-chain?
      (connection-open-proc db-chain:connection-open-proc)
      (connection-close-proc db-chain:connection-close-proc)
      )

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

    (define (make-invoker accessor)
      (lambda (the-record . args)
        (apply (accessor the-record) args)))
    ))
