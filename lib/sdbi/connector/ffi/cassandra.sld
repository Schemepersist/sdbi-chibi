(define-library (sdbi connector ffi cassandra)
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



   )

  (import (scheme base)
          ;; (scheme write)
          )
  (include-shared "cassandra/cassandra")
;;  (include "cassandra/cassandra.scm")
  )
