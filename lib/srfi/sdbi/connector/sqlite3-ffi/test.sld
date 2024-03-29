(define-library (srfi sdbi connector sqlite3-ffi test)
  (export run-tests)

  (import (scheme base)

          (chibi test)

          (srfi sdbi connector sqlite3-ffi))

  (begin

    ;; any setup needed

    (define (run-tests)

      (test-group "srfi sdbi connector sqlite3-ffi"

        (test-group "Hello, world"

          (let ((db (sqlite3-open ":memory:")))
            (test-assert (sqlite3-db? db))
            (test 0 (sqlite3-exec db "CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT NOT NULL)"))
            (test 0 (sqlite3-exec db "INSERT INTO test (id, name) VALUES (1, 'Hello, world')"))
            (test '(#(1 "Hello, world")) (sqlite3-select db "SELECT * FROM test WHERE id = 1"))
            (test '() (sqlite3-select db "SELECT * FROM test WHERE id = 2"))
            (test 0 (sqlite3-exec db "DROP TABLE test"))
            (test-error (sqlite3-select db "SELECT * FROM test WHERE id = 1"))
            ;; ~~~~ do a close here
            )



          ) ;; end hello, world



        ))))
