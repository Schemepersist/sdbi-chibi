(define-library (srfi sdbi connector cassandra-ffi)
  (export
   ;; constants
   CASS_OK

   ;; basic API
   cass-cluster-new cass-cluster?
   cass-session-new cass-session?
   cass-future? cass-statement? cass-result? cass-row? cass-value?


   cass-cluster-set-contact-points
   cass-session-connect
   cass-future-error-code
   cass-statement-new
   cass-session-execute
   cass-future-get-result
   cass-result-first-row
   cass-row-get-column-by-name
   cass-value-get-string



   )

  (import (scheme base)
          ;; (scheme write)
          )
  (include-shared "cassandra-ffi/cassandra")
;;  (include "cassandra-ffi/cassandra.scm")
  )
