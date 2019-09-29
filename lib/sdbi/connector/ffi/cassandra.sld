(define-library (sdbi connector ffi cassandra)
  (export
   ;; constants
   CASS_OK

   ;; basic API
   cass-cluster-new cass-cluster?



   )

  (import (scheme base)
          ;; (scheme write)
          )
  (include-shared "cassandra/cassandra")
;;  (include "cassandra/cassandra.scm")
  )
