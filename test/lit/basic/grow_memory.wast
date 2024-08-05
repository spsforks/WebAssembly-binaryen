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
 ;; CHECK-TEXT:      (type $0 (func (param i32) (result i32)))
 ;; CHECK-BIN:      (type $0 (func (param i32) (result i32)))
 ;; CHECK-BIN-NODEBUG:      (type $0 (func (param i32) (result i32)))
 (type $0 (func (param i32) (result i32)))
 ;; CHECK-TEXT:      (type $1 (func (result i32)))
 ;; CHECK-BIN:      (type $1 (func (result i32)))
 ;; CHECK-BIN-NODEBUG:      (type $1 (func (result i32)))
 (type $1 (func (result i32)))
 ;; CHECK-TEXT:      (memory $0 1)
 ;; CHECK-BIN:      (memory $0 1)
 (memory $0 1)
 ;; CHECK-TEXT:      (export "memory" (memory $0))
 ;; CHECK-BIN:      (export "memory" (memory $0))
 (export "memory" (memory $0))
 ;; CHECK-TEXT:      (export "grow" (func $0))
 ;; CHECK-BIN:      (export "grow" (func $0))
 (export "grow" (func $0))
 ;; CHECK-TEXT:      (export "current" (func $1))
 ;; CHECK-BIN:      (export "current" (func $1))
 (export "current" (func $1))

 ;; CHECK-TEXT:      (func $0 (type $0) (param $var$0 i32) (result i32)
 ;; CHECK-TEXT-NEXT:  (memory.grow
 ;; CHECK-TEXT-NEXT:   (local.get $var$0)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (func $0 (type $0) (param $var$0 i32) (result i32)
 ;; CHECK-BIN-NEXT:  (memory.grow
 ;; CHECK-BIN-NEXT:   (local.get $var$0)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT: )
 (func $0 (; 0 ;) (type $0) (param $var$0 i32) (result i32)
  (memory.grow
   (local.get $var$0)
  )
 )

 ;; CHECK-TEXT:      (func $1 (type $1) (result i32)
 ;; CHECK-TEXT-NEXT:  (memory.size)
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (func $1 (type $1) (result i32)
 ;; CHECK-BIN-NEXT:  (memory.size)
 ;; CHECK-BIN-NEXT: )
 (func $1 (; 1 ;) (type $1) (result i32)
  (memory.size)
 )
)
;; CHECK-BIN-NODEBUG:      (memory $m0 1)

;; CHECK-BIN-NODEBUG:      (export "memory" (memory $m0))

;; CHECK-BIN-NODEBUG:      (export "grow" (func $f0))

;; CHECK-BIN-NODEBUG:      (export "current" (func $f1))

;; CHECK-BIN-NODEBUG:      (func $f0 (type $0) (param $0 i32) (result i32)
;; CHECK-BIN-NODEBUG-NEXT:  (memory.grow
;; CHECK-BIN-NODEBUG-NEXT:   (local.get $0)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $f1 (type $1) (result i32)
;; CHECK-BIN-NODEBUG-NEXT:  (memory.size)
;; CHECK-BIN-NODEBUG-NEXT: )
