;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; RUN: wasm-split %s -all --split-funcs=second,second-in-table -g -o1 %t.1.wasm -o2 %t.2.wasm
;; RUN: wasm-dis -all %t.1.wasm | filecheck %s --check-prefix PRIMARY
;; RUN: wasm-dis -all %t.2.wasm | filecheck %s --check-prefix SECONDARY

;; Test that we handle ref.func operations properly as we split out $second.
;; ref.funcs that refer to the other module must be fixed up to refer to
;; something in the same module, that then trampolines to the other.
(module
 ;; PRIMARY:      (type $0 (func))

 ;; PRIMARY:      (import "placeholder" "0" (func $placeholder_0 (type $0)))

 ;; PRIMARY:      (import "placeholder" "1" (func $placeholder_1 (type $0)))

 ;; PRIMARY:      (global $glob1 (ref func) (ref.func $prime))

 ;; PRIMARY:      (global $glob2 (ref func) (ref.func $f2))

 ;; PRIMARY:      (table $table 1 1 funcref)
 (table $table 1 1 funcref)

 (global $glob1 (ref func) (ref.func $prime))

 (global $glob2 (ref func) (ref.func $second))

 ;; PRIMARY:      (table $t1 2 funcref)

 ;; PRIMARY:      (elem $elem (table $table) (i32.const 0) func $in-table $f3)
 (elem $elem (i32.const 0) $in-table $second-in-table)

 ;; PRIMARY:      (elem $1 (table $t1) (i32.const 0) func $placeholder_0 $placeholder_1)

 ;; PRIMARY:      (elem declare func $f2 $prime)

 ;; PRIMARY:      (export "prime" (func $prime))

 ;; PRIMARY:      (export "table" (table $table))

 ;; PRIMARY:      (export "table_2" (table $t1))

 ;; PRIMARY:      (export "global" (global $glob1))

 ;; PRIMARY:      (export "global_4" (global $glob2))

 ;; PRIMARY:      (func $prime (type $0)
 ;; PRIMARY-NEXT:  (drop
 ;; PRIMARY-NEXT:   (ref.func $prime)
 ;; PRIMARY-NEXT:  )
 ;; PRIMARY-NEXT:  (drop
 ;; PRIMARY-NEXT:   (ref.func $f2)
 ;; PRIMARY-NEXT:  )
 ;; PRIMARY-NEXT: )
 (func $prime
  (drop
   (ref.func $prime)
  )
  (drop
   (ref.func $second)
  )
 )

 ;; SECONDARY:      (type $0 (func))

 ;; SECONDARY:      (import "primary" "table_2" (table $timport$0 2 funcref))

 ;; SECONDARY:      (import "primary" "table" (table $table 1 1 funcref))

 ;; SECONDARY:      (import "primary" "global" (global $glob1 (ref func)))

 ;; SECONDARY:      (import "primary" "global_4" (global $glob2 (ref func)))

 ;; SECONDARY:      (import "primary" "prime" (func $prime (type $0)))

 ;; SECONDARY:      (elem $0 (table $timport$0) (i32.const 0) func $second $second-in-table)

 ;; SECONDARY:      (elem declare func $prime)

 ;; SECONDARY:      (func $second (type $0)
 ;; SECONDARY-NEXT:  (drop
 ;; SECONDARY-NEXT:   (ref.func $prime)
 ;; SECONDARY-NEXT:  )
 ;; SECONDARY-NEXT:  (drop
 ;; SECONDARY-NEXT:   (ref.func $second)
 ;; SECONDARY-NEXT:  )
 ;; SECONDARY-NEXT: )
 (func $second
  (drop
   (ref.func $prime)
  )
  (drop
   (ref.func $second)
  )
 )

 ;; PRIMARY:      (func $in-table (type $0)
 ;; PRIMARY-NEXT:  (nop)
 ;; PRIMARY-NEXT: )
 (func $in-table
  ;; This empty function is in the table. Just being present in the table is not
  ;; enough of a reason for us to make a trampoline, even though in our IR the
  ;; table is a list of ref.funcs.
 )

 ;; SECONDARY:      (func $second-in-table (type $0)
 ;; SECONDARY-NEXT:  (nop)
 ;; SECONDARY-NEXT: )
 (func $second-in-table
  ;; As above, but in the secondary module. We still don't need a trampoline
  ;; (but we will get a placeholder, as all split-out functions do).
 )
)
;; PRIMARY:      (func $f2 (type $0)
;; PRIMARY-NEXT:  (call_indirect $t1 (type $0)
;; PRIMARY-NEXT:   (i32.const 0)
;; PRIMARY-NEXT:  )
;; PRIMARY-NEXT: )

;; PRIMARY:      (func $f3 (type $0)
;; PRIMARY-NEXT:  (call_indirect $t1 (type $0)
;; PRIMARY-NEXT:   (i32.const 1)
;; PRIMARY-NEXT:  )
;; PRIMARY-NEXT: )
