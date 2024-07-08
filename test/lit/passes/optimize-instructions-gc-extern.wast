;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s --optimize-instructions -all -S -o - \
;; RUN:   | filecheck %s

(module
  ;; CHECK:      (func $extern.convert_any (type $0) (param $x anyref) (param $y externref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (extern.convert_any
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (extern.convert_any
  ;; CHECK-NEXT:    (ref.as_non_null
  ;; CHECK-NEXT:     (local.get $x)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (any.convert_extern
  ;; CHECK-NEXT:    (local.get $y)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (any.convert_extern
  ;; CHECK-NEXT:    (ref.as_non_null
  ;; CHECK-NEXT:     (local.get $y)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $extern.convert_any (export "ext") (param $x (ref null any)) (param $y (ref null extern))
    ;; We should not change anything here, and also not hit an internal error.
    (drop
      (extern.convert_any
        (local.get $x)
      )
    )
    (drop
      (extern.convert_any
        (ref.as_non_null
          (local.get $x)
        )
      )
    )
    (drop
      (any.convert_extern
        (local.get $y)
      )
    )
    (drop
      (any.convert_extern
        (ref.as_non_null
          (local.get $y)
        )
      )
    )
  )
)
