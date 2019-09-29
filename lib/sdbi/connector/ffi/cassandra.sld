(define-library (sdbi connector ffi cassandra)
  (export
   ;; constants
   CASS_OK

   ;; basic API
   cass-cluster-new cass-cluster?
   cass-cluster-new cass-cluster?



   cass-cluster-set-contact-points



   )

  (import (scheme base)
          ;; (scheme write)
          )
  (include-shared "cassandra/cassandra")
;;  (include "cassandra/cassandra.scm")
  )
