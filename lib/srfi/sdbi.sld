(define-library (srfi sdbi)
  (export

  make-db-chain db-chain? db-chain:foo db-chain:set-foo!


   )

  (import (scheme base)

          )

  (include "sdbi/sdbi.scm")
  )
