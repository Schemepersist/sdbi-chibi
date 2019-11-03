(define-library (srfi sdbi)
  (export

   db-chain? db-chain-construct db-chain-dismantle



   )

  (import (scheme base)
          (chibi)
          (srfi sdbi records)
          )

  (include "sdbi/sdbi.scm")
  )
