(define-library (sdbi connector net postgresql test)
  (export run-tests)

  (import (scheme base)

;;          (scheme write)

          (chibi test)
          (only (chibi process) exit) ;; for testing

          (only (srfi 98) get-environment-variable)

;;          (sdbi connector net postgresql digest md5)
;;          (sdbi connector net postgresql misc bytevectors)
;;          (sdbi connector net postgresql misc socket)
;;          (sdbi connector net postgresql messages)
          (sdbi connector net postgresql))

  (begin

    ;; any setup needed

    (define (run-tests)

      (test-group "sdbi connector net postgresql"

        (test-group "Hello, world"

          (let ((db (make-postgresql-connection "localhost" 5432 "testdb" "testuser" (get-environment-variable "SDBI_POSTGRESQL_PASSWORD"))))
            (test-assert (postgresql-connection? db))
            (test-assert (postgresql-open-connection! db))
            (test-assert (postgresql-login! db))
            (let ((ret (postgresql-execute-sql! db "SELECT version()")))
              (test-assert (postgresql-query? ret))
              (test-assert (vector? (postgresql-fetch-query! ret)))
              (test-not (postgresql-fetch-query! ret)))
            (test-assert (postgresql-execute-sql! db "CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT NOT NULL)"))
            (test-assert (postgresql-execute-sql! db "INSERT INTO test (id, name) VALUES (1, 'Hello, world')"))
            (let ((ret (postgresql-execute-sql! db "SELECT * FROM test WHERE id = 1")))
              (test-assert (postgresql-query? ret))
              (test #(1 "Hello, world") (postgresql-fetch-query! ret))
              (test-not (postgresql-fetch-query! ret)))
            (let ((ret (postgresql-execute-sql! db "SELECT * FROM test WHERE id = 2")))
              (test-assert (postgresql-query? ret))
              (test-not (postgresql-fetch-query! ret)))
            (test-assert (postgresql-execute-sql! db "DROP TABLE test"))
            (test-error (postgresql-execute-sql! db "SELECT * FROM test WHERE id = 1"))
            (postgresql-terminate! db)
            )



          ) ;; end hello, world



        ))))
