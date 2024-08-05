;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.
;; RUN: wasm-opt %s -all -S -o - | filecheck %s
;; RUN: wasm-opt %s -all --roundtrip -S -o - | filecheck %s

;; Check that intermediate types in subtype chains are also included in the
;; output module, even if there are no other references to those intermediate
;; types.

(module
  ;; CHECK:      (type $root (sub (struct)))
  (type $root (sub (struct)))

  ;; CHECK:      (type $trunk (sub $root (struct (field i32))))
  (type $trunk (sub $root (struct i32)))

  ;; CHECK:      (type $branch (sub $trunk (struct (field i32) (field i64))))
  (type $branch (sub $trunk (struct i32 i64)))

  ;; CHECK:      (type $twig (sub $branch (struct (field i32) (field i64) (field f32))))
  (type $twig (sub $branch (struct i32 i64 f32)))

  ;; CHECK:      (type $leaf (sub $twig (struct (field i32) (field i64) (field f32) (field f64))))
  (type $leaf (sub $twig (struct i32 i64 f32 f64)))

  ;; CHECK:      (type $5 (func (param (ref $leaf)) (result (ref null $root))))

  ;; CHECK:      (func $make-root (type $5) (param $leaf (ref $leaf)) (result (ref null $root))
  ;; CHECK-NEXT:  (local.get $leaf)
  ;; CHECK-NEXT: )
  (func $make-root (param $leaf (ref $leaf)) (result (ref null $root))
    (local.get $leaf)
  )
)
