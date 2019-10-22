(define-library (srfi sdbi)
  (export

   db-chain? db-chain-construct db-chain-dismantle



   )

  (import (scheme base)
          (chibi)
          (srfi sdbi objects)
          )

  (include "sdbi/sdbi.scm")
  )
