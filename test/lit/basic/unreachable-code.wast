;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; RUN: wasm-opt %s -all -o %t.text.wast -g -S
;; RUN: wasm-as %s -all -g -o %t.wasm
;; RUN: wasm-dis %t.wasm -all -o %t.bin.wast
;; RUN: wasm-as %s -all -o %t.nodebug.wasm
;; RUN: wasm-dis %t.nodebug.wasm -all -o %t.bin.nodebug.wast
;; RUN: cat %t.text.wast | filecheck %s --check-prefix=CHECK-TEXT
;; RUN: cat %t.bin.wast | filecheck %s --check-prefix=CHECK-BIN
;; RUN: cat %t.bin.nodebug.wast | filecheck %s --check-prefix=CHECK-BIN-NODEBUG

(module
  ;; CHECK-TEXT:      (type $0 (func))

  ;; CHECK-TEXT:      (func $a (type $0)
  ;; CHECK-TEXT-NEXT:  (if
  ;; CHECK-TEXT-NEXT:   (i32.const 1)
  ;; CHECK-TEXT-NEXT:   (then
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (type $0 (func))

  ;; CHECK-BIN:      (func $a (type $0)
  ;; CHECK-BIN-NEXT:  (if
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (then
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT: )
  (func $a
    (if (i32.const 1)
      (then
        (unreachable)
      )
    )
  )

  ;; CHECK-TEXT:      (func $b (type $0)
  ;; CHECK-TEXT-NEXT:  (if
  ;; CHECK-TEXT-NEXT:   (i32.const 1)
  ;; CHECK-TEXT-NEXT:   (then
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:   (else
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $b (type $0)
  ;; CHECK-BIN-NEXT:  (if
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (then
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:   (else
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT: )
  (func $b
    (if (i32.const 1)
      (then
        (unreachable)
      )
      (else
        (unreachable)
      )
    )
  )

  ;; CHECK-TEXT:      (func $a-block (type $0)
  ;; CHECK-TEXT-NEXT:  (if
  ;; CHECK-TEXT-NEXT:   (i32.const 1)
  ;; CHECK-TEXT-NEXT:   (then
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $a-block (type $0)
  ;; CHECK-BIN-NEXT:  (if
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (then
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT: )
  (func $a-block
    (block
      (if (i32.const 1)
        (then
          (unreachable)
        )
      )
    )
  )

  ;; CHECK-TEXT:      (func $b-block (type $0)
  ;; CHECK-TEXT-NEXT:  (if
  ;; CHECK-TEXT-NEXT:   (i32.const 1)
  ;; CHECK-TEXT-NEXT:   (then
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:   (else
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $b-block (type $0)
  ;; CHECK-BIN-NEXT:  (if
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (then
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:   (else
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT: )
  (func $b-block
    (block
      (if (i32.const 1)
        (then
          (unreachable)
        )
        (else
          (unreachable)
        )
      )
    )
  )

  ;; CHECK-TEXT:      (func $a-prepost (type $0)
  ;; CHECK-TEXT-NEXT:  (nop)
  ;; CHECK-TEXT-NEXT:  (if
  ;; CHECK-TEXT-NEXT:   (i32.const 1)
  ;; CHECK-TEXT-NEXT:   (then
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT:  (nop)
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $a-prepost (type $0)
  ;; CHECK-BIN-NEXT:  (nop)
  ;; CHECK-BIN-NEXT:  (if
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (then
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT:  (nop)
  ;; CHECK-BIN-NEXT: )
  (func $a-prepost
    (nop)
    (if (i32.const 1)
      (then
        (unreachable)
      )
    )
    (nop)
  )

  ;; CHECK-TEXT:      (func $b-prepost (type $0)
  ;; CHECK-TEXT-NEXT:  (nop)
  ;; CHECK-TEXT-NEXT:  (if
  ;; CHECK-TEXT-NEXT:   (i32.const 1)
  ;; CHECK-TEXT-NEXT:   (then
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:   (else
  ;; CHECK-TEXT-NEXT:    (unreachable)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT:  (nop)
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $b-prepost (type $0)
  ;; CHECK-BIN-NEXT:  (nop)
  ;; CHECK-BIN-NEXT:  (if
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (then
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:   (else
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT: )
  (func $b-prepost
    (nop)
    (if (i32.const 1)
      (then
        (unreachable)
      )
      (else
        (unreachable)
      )
    )
    (nop)
  )

  ;; CHECK-TEXT:      (func $a-block-prepost (type $0)
  ;; CHECK-TEXT-NEXT:  (nop)
  ;; CHECK-TEXT-NEXT:  (block
  ;; CHECK-TEXT-NEXT:   (if
  ;; CHECK-TEXT-NEXT:    (i32.const 1)
  ;; CHECK-TEXT-NEXT:    (then
  ;; CHECK-TEXT-NEXT:     (unreachable)
  ;; CHECK-TEXT-NEXT:    )
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT:  (nop)
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $a-block-prepost (type $0)
  ;; CHECK-BIN-NEXT:  (nop)
  ;; CHECK-BIN-NEXT:  (if
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (then
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT:  (nop)
  ;; CHECK-BIN-NEXT: )
  (func $a-block-prepost
    (nop)
    (block
      (if (i32.const 1)
        (then
          (unreachable)
        )
      )
    )
    (nop)
  )

  ;; CHECK-TEXT:      (func $b-block-prepost (type $0)
  ;; CHECK-TEXT-NEXT:  (nop)
  ;; CHECK-TEXT-NEXT:  (block
  ;; CHECK-TEXT-NEXT:   (if
  ;; CHECK-TEXT-NEXT:    (i32.const 1)
  ;; CHECK-TEXT-NEXT:    (then
  ;; CHECK-TEXT-NEXT:     (unreachable)
  ;; CHECK-TEXT-NEXT:    )
  ;; CHECK-TEXT-NEXT:    (else
  ;; CHECK-TEXT-NEXT:     (unreachable)
  ;; CHECK-TEXT-NEXT:    )
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT:  (nop)
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $b-block-prepost (type $0)
  ;; CHECK-BIN-NEXT:  (nop)
  ;; CHECK-BIN-NEXT:  (if
  ;; CHECK-BIN-NEXT:   (i32.const 1)
  ;; CHECK-BIN-NEXT:   (then
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:   (else
  ;; CHECK-BIN-NEXT:    (unreachable)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT: )
  (func $b-block-prepost
    (nop)
    (block
      (if (i32.const 1)
        (then
          (unreachable)
        )
        (else
          (unreachable)
        )
      )
    )
    (nop)
  )

  ;; CHECK-TEXT:      (func $recurse (type $0)
  ;; CHECK-TEXT-NEXT:  (block $a
  ;; CHECK-TEXT-NEXT:   (nop)
  ;; CHECK-TEXT-NEXT:   (block $b
  ;; CHECK-TEXT-NEXT:    (nop)
  ;; CHECK-TEXT-NEXT:    (br $b)
  ;; CHECK-TEXT-NEXT:    (nop)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:   (nop)
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $recurse (type $0)
  ;; CHECK-BIN-NEXT:  (nop)
  ;; CHECK-BIN-NEXT:  (block $label$1
  ;; CHECK-BIN-NEXT:   (nop)
  ;; CHECK-BIN-NEXT:   (br $label$1)
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT:  (nop)
  ;; CHECK-BIN-NEXT: )
  (func $recurse
    (block $a
      (nop)
      (block $b
        (nop)
        (br $b)
        (nop)
      )
      (nop)
    )
  )

  ;; CHECK-TEXT:      (func $recurse-b (type $0)
  ;; CHECK-TEXT-NEXT:  (block $a
  ;; CHECK-TEXT-NEXT:   (nop)
  ;; CHECK-TEXT-NEXT:   (block $b
  ;; CHECK-TEXT-NEXT:    (nop)
  ;; CHECK-TEXT-NEXT:    (br $a)
  ;; CHECK-TEXT-NEXT:    (nop)
  ;; CHECK-TEXT-NEXT:   )
  ;; CHECK-TEXT-NEXT:   (nop)
  ;; CHECK-TEXT-NEXT:  )
  ;; CHECK-TEXT-NEXT: )
  ;; CHECK-BIN:      (func $recurse-b (type $0)
  ;; CHECK-BIN-NEXT:  (block $label$1
  ;; CHECK-BIN-NEXT:   (nop)
  ;; CHECK-BIN-NEXT:   (block $label$2
  ;; CHECK-BIN-NEXT:    (nop)
  ;; CHECK-BIN-NEXT:    (br $label$1)
  ;; CHECK-BIN-NEXT:   )
  ;; CHECK-BIN-NEXT:  )
  ;; CHECK-BIN-NEXT: )
  (func $recurse-b
    (block $a
      (nop)
      (block $b
        (nop)
        (br $a)
        (nop)
      )
      (nop)
    )
  )
)
;; CHECK-BIN-NODEBUG:      (type $0 (func))

;; CHECK-BIN-NODEBUG:      (func $f0 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (if
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (then
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f1 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (if
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (then
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:   (else
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f2 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (if
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (then
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f3 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (if
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (then
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:   (else
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f4 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (nop)
;; CHECK-BIN-NODEBUG-NEXT:  (if
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (then
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (nop)
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f5 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (nop)
;; CHECK-BIN-NODEBUG-NEXT:  (if
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (then
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:   (else
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f6 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (nop)
;; CHECK-BIN-NODEBUG-NEXT:  (if
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (then
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (nop)
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f7 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (nop)
;; CHECK-BIN-NODEBUG-NEXT:  (if
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (then
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:   (else
;; CHECK-BIN-NODEBUG-NEXT:    (unreachable)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f8 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (nop)
;; CHECK-BIN-NODEBUG-NEXT:  (block $label$1
;; CHECK-BIN-NODEBUG-NEXT:   (nop)
;; CHECK-BIN-NODEBUG-NEXT:   (br $label$1)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (nop)
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f9 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (block $label$1
;; CHECK-BIN-NODEBUG-NEXT:   (nop)
;; CHECK-BIN-NODEBUG-NEXT:   (block $label$2
;; CHECK-BIN-NODEBUG-NEXT:    (nop)
;; CHECK-BIN-NODEBUG-NEXT:    (br $label$1)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )
