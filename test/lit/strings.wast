;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; Check that string types are emitted properly in the binary format.
;;
;; runs --precompute in order to verify no problems occur in the optimizer's
;; invocation of the interpreter.

;; RUN: wasm-opt %s --enable-strings --enable-reference-types --enable-gc --roundtrip --precompute -S -o - | filecheck %s

;; Check that we can roundtrip through the text format as well.

;; RUN: wasm-opt %s -all -S -o - | wasm-opt -all --precompute -S -o - | filecheck %s

(module
  (memory 10 10)

  ;; CHECK:      (type $0 (func (param stringref stringref)))

  ;; CHECK:      (type $array (sub (array (mut i8))))
  (type $array (sub (array (mut i8))))
  ;; CHECK:      (type $array16 (sub (array (mut i16))))
  (type $array16 (sub (array (mut i16))))

  ;; CHECK:      (type $3 (func (param (ref string))))

  ;; CHECK:      (type $4 (func (param stringref)))

  ;; CHECK:      (type $5 (func (param (ref $array) (ref $array16))))

  ;; CHECK:      (type $6 (func (param stringref (ref $array) (ref $array16))))

  ;; CHECK:      (type $7 (func))

  ;; CHECK:      (global $string-const stringref (string.const "string in a global \c2\a3_\e2\82\ac_\f0\90\8d\88 \01\00\t\t\n\n\r\r\"\"\'\'\\\\ "))
  (global $string-const stringref (string.const "string in a global \C2\A3_\E2\82\AC_\F0\90\8D\88 \01\00\t\t\n\n\r\r\"\"\'\'\\\\ "))

  ;; CHECK:      (memory $m0 10 10)

  ;; CHECK:      (func $string.const (type $3) (param $param (ref string))
  ;; CHECK-NEXT:  (call $string.const
  ;; CHECK-NEXT:   (string.const "foo")
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (call $string.const
  ;; CHECK-NEXT:   (string.const "foo")
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (call $string.const
  ;; CHECK-NEXT:   (string.const "bar")
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $string.const (param $param (ref string))
    ;; Use calls to avoid precompute removing dropped constants.
    (call $string.const
      (string.const "foo")
    )
    (call $string.const
      (string.const "foo") ;; intentionally repeat the previous one
    )
    (call $string.const
      (string.const "bar")
    )
  )

  ;; CHECK:      (func $string.measure (type $4) (param $ref stringref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.eqz
  ;; CHECK-NEXT:    (string.measure_wtf16
  ;; CHECK-NEXT:     (local.get $ref)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (string.measure_utf8
  ;; CHECK-NEXT:    (local.get $ref)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $string.measure (param $ref stringref)
    (drop
      (i32.eqz ;; validate the output is i32
        (string.measure_wtf16
          (local.get $ref)
        )
      )
    )
    (drop
      (string.measure_utf8
        (local.get $ref)
      )
    )
  )

  ;; CHECK:      (func $string.concat (type $0) (param $a stringref) (param $b stringref)
  ;; CHECK-NEXT:  (local.set $a
  ;; CHECK-NEXT:   (string.concat
  ;; CHECK-NEXT:    (local.get $a)
  ;; CHECK-NEXT:    (local.get $b)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $string.concat (param $a stringref) (param $b stringref)
    (local.set $a ;; validate the output is a stringref
      (string.concat
        (local.get $a)
        (local.get $b)
      )
    )
  )

  ;; CHECK:      (func $string.eq (type $0) (param $a stringref) (param $b stringref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.eqz
  ;; CHECK-NEXT:    (string.eq
  ;; CHECK-NEXT:     (local.get $a)
  ;; CHECK-NEXT:     (local.get $b)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $string.eq (param $a stringref) (param $b stringref)
    (drop
      (i32.eqz ;; validate the output is an i32
        (string.eq
          (local.get $a)
          (local.get $b)
        )
      )
    )
  )

  ;; CHECK:      (func $string.compare (type $0) (param $a stringref) (param $b stringref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.eqz
  ;; CHECK-NEXT:    (string.compare
  ;; CHECK-NEXT:     (local.get $a)
  ;; CHECK-NEXT:     (local.get $b)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $string.compare (param $a stringref) (param $b stringref)
    (drop
      (i32.eqz ;; validate the output is an i32
        (string.compare
          (local.get $a)
          (local.get $b)
        )
      )
    )
  )

  ;; CHECK:      (func $string.new.gc (type $5) (param $array (ref $array)) (param $array16 (ref $array16))
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (string.new_wtf16_array
  ;; CHECK-NEXT:    (local.get $array16)
  ;; CHECK-NEXT:    (i32.const 7)
  ;; CHECK-NEXT:    (i32.const 8)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (string.new_lossy_utf8_array
  ;; CHECK-NEXT:    (local.get $array)
  ;; CHECK-NEXT:    (i32.const 5)
  ;; CHECK-NEXT:    (i32.const 6)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $string.new.gc (param $array (ref $array)) (param $array16 (ref $array16))
    (drop
      (string.new_wtf16_array
        (local.get $array16)
        (i32.const 7)
        (i32.const 8)
      )
    )
    (drop
      (string.new_lossy_utf8_array
        (local.get $array)
        (i32.const 5)
        (i32.const 6)
      )
    )
  )

  ;; CHECK:      (func $string.encode.gc (type $6) (param $ref stringref) (param $array (ref $array)) (param $array16 (ref $array16))
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.eqz
  ;; CHECK-NEXT:    (string.encode_wtf16_array
  ;; CHECK-NEXT:     (local.get $ref)
  ;; CHECK-NEXT:     (local.get $array16)
  ;; CHECK-NEXT:     (i32.const 30)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (string.encode_lossy_utf8_array
  ;; CHECK-NEXT:    (local.get $ref)
  ;; CHECK-NEXT:    (local.get $array)
  ;; CHECK-NEXT:    (i32.const 10)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $string.encode.gc (param $ref stringref) (param $array (ref $array)) (param $array16 (ref $array16))
    (drop
      (i32.eqz ;; validate the output is i32
        (string.encode_wtf16_array
          (local.get $ref)
          (local.get $array16)
          (i32.const 30)
        )
      )
    )
    (drop
      (string.encode_lossy_utf8_array
        (local.get $ref)
        (local.get $array)
        (i32.const 10)
      )
    )
  )

  ;; CHECK:      (func $string.from_code_point (type $7)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (string.from_code_point
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $string.from_code_point
    (drop
      (string.from_code_point
        (i32.const 1)
      )
    )
  )
)
