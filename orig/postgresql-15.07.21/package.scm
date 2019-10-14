(package
  (maintainers "Takashi Kato <ktakashi@ymail.com>")
  (authors "Takashi Kato")
  (version "15.07.21")
  (library
    (name
      (postgresql))
    (path "postgresql.sld")
    (depends
      (postgresql apis)))
  (library
    (name
      (postgresql apis))
    (path "postgresql/apis.sld")
    (cond-expand
      ((library (srfi 19))
        (depends
          (srfi 19)))
      (else
        (depends)))
    (depends
      (scheme base)
      (scheme write)
      (scheme char)
      (postgresql messages)
      (postgresql digest md5)
      (postgresql misc socket)
      (postgresql misc bytevectors)))
  (library
    (name
      (postgresql messages))
    (path "postgresql/messages.sld")
    (cond-expand
      ((library (srfi 19))
        (depends
          (srfi 19)))
      (else
        (depends)))
    (depends
      (scheme base)
      (scheme write)
      (postgresql misc socket)
      (postgresql misc bytevectors)
      (postgresql misc io)))
  (library
    (name
      (postgresql misc socket))
    (path "postgresql/misc/socket.sld")
    (cond-expand
      ((library (srfi 106))
        (depends
          (srfi 106)))
      (chibi
        (depends
          (scheme base)
          (chibi net)
          (scheme cxr)
          (chibi filesystem))))
    (cond-expand
      (gauche
        (depends
          (gauche base)))
      (else
        (depends)))
    (depends))
  (library
    (name
      (postgresql misc bytevectors))
    (path "postgresql/misc/bytevectors.sld")
    (cond-expand
      (sagittarius
        (depends
          (rnrs)
          (sagittarius)
          (sagittarius control)))
      ((library (chibi bytevector))
        (depends
          (scheme base)
          (chibi bytevector)))
      (else
        (cond-expand
          ((library (srfi 60))
            (depends
              (srfi 60)))
          ((library (srfi 33))
            (depends
              (srfi 33))))
        (depends
          (scheme base)
          (scheme char))))
    (cond-expand
      (sagittarius
        (depends
          (util bytevector)))
      (else
        (depends)))
    (depends))
  (library
    (name
      (postgresql misc io))
    (path "postgresql/misc/io.sld")
    (cond-expand
      (sagittarius
        (depends
          (binary io)
          (rnrs)))
      (else
        (cond-expand
          ((library (srfi 60))
            (depends
              (srfi 60)))
          ((library (srfi 33))
            (depends
              (srfi 33))))
        (depends)))
    (depends
      (scheme base)
      (scheme case-lambda)))
  (library
    (name
      (postgresql digest md5))
    (path "postgresql/digest/md5.sld")
    (cond-expand
      (sagittarius
        (depends
          (math)
          (postgresql misc bytevectors)
          (rnrs)))
      (else
        (cond-expand
          ((library (rnrs))
            (depends
              (rnrs)))
          ((library (srfi 60))
            (depends
              (srfi 60)))
          ((library (srfi 33))
            (depends
              (srfi 33)))
          (else
            (depends)))
        (depends
          (postgresql misc bytevectors))))
    (depends
      (scheme base)))
  (library
    (name
      (postgresql misc socket))
    (path "postgresql/misc/socket.sld")
    (cond-expand
      ((library (srfi 106))
        (depends
          (srfi 106)))
      (chibi
        (depends
          (scheme base)
          (chibi net)
          (scheme cxr)
          (chibi filesystem))))
    (cond-expand
      (gauche
        (depends
          (gauche base)))
      (else
        (depends)))
    (depends))
  (library
    (name
      (postgresql misc bytevectors))
    (path "postgresql/misc/bytevectors.sld")
    (cond-expand
      (sagittarius
        (depends
          (rnrs)
          (sagittarius)
          (sagittarius control)))
      ((library (chibi bytevector))
        (depends
          (scheme base)
          (chibi bytevector)))
      (else
        (cond-expand
          ((library (srfi 60))
            (depends
              (srfi 60)))
          ((library (srfi 33))
            (depends
              (srfi 33))))
        (depends
          (scheme base)
          (scheme char))))
    (cond-expand
      (sagittarius
        (depends
          (util bytevector)))
      (else
        (depends)))
    (depends))
  (manual "README.md")
  (description "R7RS portable PostgreSQL binding")
  (test "test.scm")
  (test-depends
    (scheme base)
    (postgresql digest md5)
    (postgresql misc bytevectors)
    (postgresql misc socket)
    (postgresql messages)
    (postgresql)))
