(define-library (sdbi connector ffi cassandra test)
  (export run-tests)

  (import (scheme base)
          (scheme small)

          (chibi test)

          (sdbi connector ffi cassandra))

  (begin

    ;; any setup needed

    (define (run-tests version-string)

      (test-group "sdbi connector ffi cassandra"

        (test-group "Preliminary, just test connection"

          (let ((cluster (cass-cluster-new))
                (session (cass-session-new))
                (statement (cass-statement-new "SELECT release_version FROM system.local" 0)))
            (test 0 (cass-cluster-set-contact-points cluster "127.0.0.1"))

            ;; note you *must* execute cass-future-error-code on the following, or the next error code return will not be CASS_OK (which is 0)
            (test CASS_OK (cass-future-error-code (cass-session-connect session cluster)))

            (let ((future (cass-session-execute session statement)))
              (test CASS_OK (cass-future-error-code future))

              (let* ((result (cass-future-get-result future))
                     (row (cass-result-first-row result))
                     (row-column (cass-row-get-column-by-name row "release_version"))
                     (value-list (cass-value-get-string row-column)))
                (test-assert row)
                (test-assert row-column)
                (test-assert (list? value-list))
                (test version-string (substring (cadr value-list) 0 (caddr value-list))))
              ;; ~~~~ close out stuff here
              ))



            ) ;; end preliminary



          ))))
