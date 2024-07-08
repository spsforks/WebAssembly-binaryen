;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; RUN: foreach %s %t wasm-opt --type-ssa -all -S -o - | filecheck %s

;; Every struct.new here should get a new type.
(module
  ;; CHECK:      (type $struct (sub (struct (field i32))))
  (type $struct (sub (struct (field i32))))

  ;; CHECK:      (type $1 (func))

  ;; CHECK:      (rec
  ;; CHECK-NEXT:  (type $struct_1 (sub $struct (struct (field i32))))

  ;; CHECK:       (type $struct_2 (sub $struct (struct (field i32))))

  ;; CHECK:       (type $struct_3 (sub $struct (struct (field i32))))

  ;; CHECK:       (type $struct_4 (sub $struct (struct (field i32))))

  ;; CHECK:       (type $struct_5 (sub $struct (struct (field i32))))

  ;; CHECK:      (global $g (ref $struct) (struct.new $struct_4
  ;; CHECK-NEXT:  (i32.const 42)
  ;; CHECK-NEXT: ))
  (global $g (ref $struct) (struct.new $struct
    (i32.const 42)
  ))

  ;; CHECK:      (global $h (ref $struct) (struct.new $struct_5
  ;; CHECK-NEXT:  (i32.const 42)
  ;; CHECK-NEXT: ))
  (global $h (ref $struct) (struct.new $struct
    (i32.const 42)
  ))

  ;; CHECK:      (func $foo (type $1)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new_default $struct_1)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new $struct_2
  ;; CHECK-NEXT:    (i32.const 10)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $foo
    (drop
      (struct.new_default $struct)
    )
    (drop
      (struct.new $struct
        (i32.const 10)
      )
    )
  )

  ;; CHECK:      (func $another-func (type $1)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new $struct_3
  ;; CHECK-NEXT:    (i32.const 100)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $another-func
    (drop
      (struct.new $struct
        (i32.const 100)
      )
    )
  )
)

;; The same module as before, except that now the type is final, so we cannot
;; create any subtypes.
(module
  ;; CHECK:      (type $struct (struct (field i32)))
  (type $struct (sub final (struct (field i32))))

  ;; CHECK:      (type $1 (func))

  ;; CHECK:      (global $g (ref $struct) (struct.new $struct
  ;; CHECK-NEXT:  (i32.const 42)
  ;; CHECK-NEXT: ))
  (global $g (ref $struct) (struct.new $struct
    (i32.const 42)
  ))

  ;; CHECK:      (global $h (ref $struct) (struct.new $struct
  ;; CHECK-NEXT:  (i32.const 42)
  ;; CHECK-NEXT: ))
  (global $h (ref $struct) (struct.new $struct
    (i32.const 42)
  ))

  ;; CHECK:      (func $foo (type $1)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new_default $struct)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new $struct
  ;; CHECK-NEXT:    (i32.const 10)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $foo
    (drop
      (struct.new_default $struct)
    )
    (drop
      (struct.new $struct
        (i32.const 10)
      )
    )
  )

  ;; CHECK:      (func $another-func (type $1)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new $struct
  ;; CHECK-NEXT:    (i32.const 100)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $another-func
    (drop
      (struct.new $struct
        (i32.const 100)
      )
    )
  )
)

;; Some of these are uninteresting and should not get a new type.
(module

  ;; CHECK:      (type $0 (func (param anyref arrayref)))

  ;; CHECK:      (type $struct (sub (struct (field anyref))))
  (type $struct (sub (struct (field (ref null any)))))

  ;; CHECK:      (rec
  ;; CHECK-NEXT:  (type $struct_1 (sub $struct (struct (field anyref))))

  ;; CHECK:       (type $struct_2 (sub $struct (struct (field anyref))))

  ;; CHECK:       (type $struct_3 (sub $struct (struct (field anyref))))

  ;; CHECK:      (func $foo (type $0) (param $any anyref) (param $array arrayref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new_default $struct_1)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new $struct_2
  ;; CHECK-NEXT:    (ref.null none)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new $struct
  ;; CHECK-NEXT:    (local.get $any)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new $struct_3
  ;; CHECK-NEXT:    (local.get $array)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block ;; (replaces unreachable StructNew we can't emit)
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (unreachable)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $foo (param $any (ref null any)) (param $array (ref null array))
    ;; A null is interesting.
    (drop
      (struct.new_default $struct)
    )
    (drop
      (struct.new $struct
        (ref.null none)
      )
    )
    ;; An unknown value of the same type is uninteresting.
    (drop
      (struct.new $struct
        (local.get $any)
      )
    )
    ;; But a more refined type piques our interest.
    (drop
      (struct.new $struct
        (local.get $array)
      )
    )
    ;; An unreachable is boring.
    (drop
      (struct.new $struct
        (unreachable)
      )
    )
  )
)

(module
  ;; CHECK:      (type $array (sub (array (mut anyref))))
  (type $array (sub (array (mut (ref null any)))))

  ;; CHECK:      (type $1 (func (param (ref i31) anyref)))

  ;; CHECK:      (type $array-func (sub (array (mut funcref))))
  (type $array-func (sub (array (mut funcref))))

  (elem func $array.new)

  ;; CHECK:      (rec
  ;; CHECK-NEXT:  (type $array_1 (sub $array (array (mut anyref))))

  ;; CHECK:       (type $array_2 (sub $array (array (mut anyref))))

  ;; CHECK:       (type $array_3 (sub $array (array (mut anyref))))

  ;; CHECK:       (type $array-func_4 (sub $array-func (array (mut funcref))))

  ;; CHECK:       (type $array_5 (sub $array (array (mut anyref))))

  ;; CHECK:       (type $array_6 (sub $array (array (mut anyref))))

  ;; CHECK:      (type $9 (func))

  ;; CHECK:      (elem $0 func $array.new)

  ;; CHECK:      (func $array.new (type $1) (param $refined (ref i31)) (param $null-any anyref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new_default $array_1
  ;; CHECK-NEXT:    (i32.const 5)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new $array_2
  ;; CHECK-NEXT:    (ref.null none)
  ;; CHECK-NEXT:    (i32.const 5)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new $array_3
  ;; CHECK-NEXT:    (local.get $refined)
  ;; CHECK-NEXT:    (i32.const 5)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new $array
  ;; CHECK-NEXT:    (local.get $null-any)
  ;; CHECK-NEXT:    (i32.const 5)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $array.new (param $refined (ref i31)) (param $null-any (ref null any))
    ;; Default null, an interesting value, so we get a new type.
    (drop
      (array.new_default $array
        (i32.const 5)
      )
    )
    ;; Given null, also interesting.
    (drop
      (array.new $array
        (ref.null none)
        (i32.const 5)
      )
    )
    ;; More refined type, interesting.
    (drop
      (array.new $array
        (local.get $refined)
        (i32.const 5)
      )
    )
    ;; Same type as declared - boring, no new type.
    (drop
      (array.new $array
        (local.get $null-any)
        (i32.const 5)
      )
    )
  )

  ;; CHECK:      (func $array.new_seg (type $9)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new_elem $array-func_4 $0
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $array.new_seg
    ;; We consider all new_elem to be interesting as we don't look at the elem
    ;; data yet.
    (drop
      (array.new_elem $array-func 0
        (i32.const 0)
        (i32.const 3)
      )
    )
  )

  ;; CHECK:      (func $array.new_fixed (type $1) (param $refined (ref i31)) (param $null-any anyref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new_fixed $array_5 1
  ;; CHECK-NEXT:    (ref.null none)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new_fixed $array_6 1
  ;; CHECK-NEXT:    (local.get $refined)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new_fixed $array 1
  ;; CHECK-NEXT:    (local.get $null-any)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new_fixed $array 2
  ;; CHECK-NEXT:    (local.get $refined)
  ;; CHECK-NEXT:    (local.get $null-any)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $array.new_fixed (param $refined (ref i31)) (param $null-any (ref null any))
    ;; Null, interesting, so we get a new type.
    (drop
      (array.new_fixed $array 1
        (ref.null none)
      )
    )
    ;; More refined type, interesting.
    (drop
      (array.new_fixed $array 1
        (local.get $refined)
      )
    )
    ;; Same type as declared - boring, no new type.
    (drop
      (array.new_fixed $array 1
        (local.get $null-any)
      )
    )
    ;; Mixture of boring and interesting => boring (since we infer a single type
    ;; for the entire array).
    (drop
      (array.new_fixed $array 2
        (local.get $refined)
        (local.get $null-any)
      )
    )
  )
)

;; Test that we do not error on externalized/internalized data. As we process
;; the fields of $struct we check if they are constants that we can handle, and
;; we should not hit any asserts while doing so. After that, we will decide not
;; to optimize $struct, since the global contains a struct.new (which we cannot
;; turn into a simple Literal). (We do optimize $empty and generate $empty$1,
;; but that is not important here.)
(module
  ;; CHECK:      (type $empty (sub (struct )))
  (type $empty (sub (struct)))

  ;; CHECK:      (type $empty_1 (sub $empty (struct )))

  ;; CHECK:      (type $2 (func (param anyref)))

  ;; CHECK:      (type $struct (sub (struct (field externref) (field anyref) (field externref))))
  (type $struct (sub (struct externref anyref externref)))

  ;; CHECK:      (global $g (mut anyref) (struct.new_default $empty_1))
  (global $g (mut anyref) (struct.new $empty))

  ;; CHECK:      (func $0 (type $2) (param $param anyref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (struct.new $struct
  ;; CHECK-NEXT:    (extern.convert_any
  ;; CHECK-NEXT:     (global.get $g)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (any.convert_extern
  ;; CHECK-NEXT:     (extern.convert_any
  ;; CHECK-NEXT:      (global.get $g)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (extern.convert_any
  ;; CHECK-NEXT:     (local.get $param)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $0 (param $param anyref)
    (drop
      (struct.new $struct
        ;; An externalized global.
        (extern.convert_any
          (global.get $g)
        )
        ;; An externalized and then internalized global.
        (any.convert_extern
          (extern.convert_any
            (global.get $g)
          )
        )
        ;; An externalized parameter.
        (extern.convert_any
          (local.get $param)
        )
      )
    )
  )
)

(module
  ;; CHECK:      (type $array (sub (array (mut f32))))
  (type $array (sub (array (mut f32))))

  ;; CHECK:      (type $subarray (sub $array (array (mut f32))))
  (type $subarray (sub $array (array (mut f32))))

  ;; CHECK:      (type $2 (func (param (ref $subarray))))

  ;; CHECK:      (rec
  ;; CHECK-NEXT:  (type $array_1 (sub $array (array (mut f32))))

  ;; CHECK:       (type $4 (struct (field (mut i32)) (field (mut i32)) (field (mut f64)) (field (mut f64)) (field (mut i32)) (field (mut f64)) (field (mut f64)) (field (mut i32)) (field (mut i32)) (field (mut i32)) (field (mut i32))))

  ;; CHECK:      (func $1 (type $2) (param $ref (ref $subarray))
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (array.new_default $array_1
  ;; CHECK-NEXT:    (i32.const 64)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $1 (param $ref (ref $subarray))
    ;; TypeSSA will create another subtype of array, which will happen to
    ;; conflict with $subarray. We will need to create a new "weird" rec group
    ;; with a "hash" in it to avoid the conflict.
    (drop
      (array.new_default $array
        (i32.const 64)
      )
    )
  )
)

(module
  ;; CHECK:      (type $A (sub (struct )))
  (type $A (sub (struct)))

  ;; CHECK:      (type $A_1 (sub $A (struct )))

  ;; CHECK:      (type $2 (func (result (ref $A))))

  ;; CHECK:      (func $0 (type $2) (result (ref $A))
  ;; CHECK-NEXT:  (block $label (result (ref $A_1))
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (br_on_cast $label (ref $A_1) (ref $A_1)
  ;; CHECK-NEXT:     (struct.new_default $A_1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (unreachable)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $0 (result (ref $A))
    ;; After creating a subtype of $A as the input to the br_on_cast, the cast
    ;; must be refinalized so that it validates (otherwise, it would try to cast
    ;; to a supertype).
    (block $label (result (ref $A))
      (drop
        (br_on_cast $label (ref $A) (ref $A)
          (struct.new_default $A)
        )
      )
      (unreachable)
    )
  )
)
