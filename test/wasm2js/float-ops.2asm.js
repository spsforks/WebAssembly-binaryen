
function asmFunc(imports) {
 var Math_imul = Math.imul;
 var Math_fround = Math.fround;
 var Math_abs = Math.abs;
 var Math_clz32 = Math.clz32;
 var Math_min = Math.min;
 var Math_max = Math.max;
 var Math_floor = Math.floor;
 var Math_ceil = Math.ceil;
 var Math_trunc = Math.trunc;
 var Math_sqrt = Math.sqrt;
 function f0($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return Math_fround(Math_fround($0 + $1));
 }
 
 function f1($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return Math_fround(Math_fround($0 - $1));
 }
 
 function f2($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return Math_fround(Math_fround($0 * $1));
 }
 
 function f3($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return Math_fround(Math_fround($0 / $1));
 }
 
 function f4($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return +($0 + $1);
 }
 
 function f5($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return +($0 - $1);
 }
 
 function f6($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return +($0 * $1);
 }
 
 function f7($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return +($0 / $1);
 }
 
 function f8($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return $0 == $1 | 0;
 }
 
 function f9($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return $0 != $1 | 0;
 }
 
 function f10($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return $0 >= $1 | 0;
 }
 
 function f11($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return $0 > $1 | 0;
 }
 
 function f12($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return $0 <= $1 | 0;
 }
 
 function f13($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return $0 < $1 | 0;
 }
 
 function f14($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return $0 == $1 | 0;
 }
 
 function f15($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return $0 != $1 | 0;
 }
 
 function f16($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return $0 >= $1 | 0;
 }
 
 function f17($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return $0 > $1 | 0;
 }
 
 function f18($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return $0 <= $1 | 0;
 }
 
 function f19($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return $0 < $1 | 0;
 }
 
 function f20($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return Math_fround(Math_fround(Math_min($0, $1)));
 }
 
 function f21($0, $1) {
  $0 = Math_fround($0);
  $1 = Math_fround($1);
  return Math_fround(Math_fround(Math_max($0, $1)));
 }
 
 function f22($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return +Math_min($0, $1);
 }
 
 function f23($0, $1) {
  $0 = +$0;
  $1 = +$1;
  return +Math_max($0, $1);
 }
 
 function f24($0) {
  $0 = Math_fround($0);
  return +(+$0);
 }
 
 function f25($0) {
  $0 = +$0;
  return Math_fround(Math_fround($0));
 }
 
 function f26($0) {
  $0 = Math_fround($0);
  return Math_fround(Math_fround(Math_floor($0)));
 }
 
 function f27($0) {
  $0 = Math_fround($0);
  return Math_fround(Math_fround(Math_ceil($0)));
 }
 
 function f28($0) {
  $0 = +$0;
  return +Math_floor($0);
 }
 
 function f29($0) {
  $0 = +$0;
  return +Math_ceil($0);
 }
 
 function f30($0) {
  $0 = Math_fround($0);
  return Math_fround(Math_fround(Math_sqrt($0)));
 }
 
 function f31($0) {
  $0 = +$0;
  return +Math_sqrt($0);
 }
 
 function f32($0) {
  $0 = $0 | 0;
  return Math_fround(Math_fround($0 | 0));
 }
 
 function f33($0) {
  $0 = $0 | 0;
  return +(+($0 | 0));
 }
 
 function f34($0) {
  $0 = $0 | 0;
  return Math_fround(Math_fround($0 >>> 0));
 }
 
 function f35($0) {
  $0 = $0 | 0;
  return +(+($0 >>> 0));
 }
 
 function f36($0) {
  $0 = Math_fround($0);
  return ~~$0 | 0;
 }
 
 function f37($0) {
  $0 = +$0;
  return ~~$0 | 0;
 }
 
 function f38($0) {
  $0 = Math_fround($0);
  return ~~$0 >>> 0 | 0;
 }
 
 function f39($0) {
  $0 = +$0;
  return ~~$0 >>> 0 | 0;
 }
 
 function f40($0, $0$hi) {
  $0 = $0 | 0;
  $0$hi = $0$hi | 0;
  var i64toi32_i32$0 = 0;
  i64toi32_i32$0 = $0$hi;
  return Math_fround(Math_fround(+($0 >>> 0) + 4294967296.0 * +(i64toi32_i32$0 | 0)));
 }
 
 function f41($0, $0$hi) {
  $0 = $0 | 0;
  $0$hi = $0$hi | 0;
  var i64toi32_i32$0 = 0;
  i64toi32_i32$0 = $0$hi;
  return +(+($0 >>> 0) + 4294967296.0 * +(i64toi32_i32$0 | 0));
 }
 
 function f42($0, $0$hi) {
  $0 = $0 | 0;
  $0$hi = $0$hi | 0;
  var i64toi32_i32$0 = 0;
  i64toi32_i32$0 = $0$hi;
  return Math_fround(Math_fround(+($0 >>> 0) + 4294967296.0 * +(i64toi32_i32$0 >>> 0)));
 }
 
 function f43($0, $0$hi) {
  $0 = $0 | 0;
  $0$hi = $0$hi | 0;
  var i64toi32_i32$0 = 0;
  i64toi32_i32$0 = $0$hi;
  return +(+($0 >>> 0) + 4294967296.0 * +(i64toi32_i32$0 >>> 0));
 }
 
 function f44($0) {
  $0 = Math_fround($0);
  var i64toi32_i32$0 = Math_fround(0), $3 = 0, $4 = 0, i64toi32_i32$1 = 0;
  i64toi32_i32$0 = $0;
  if (Math_fround(Math_abs(i64toi32_i32$0)) >= Math_fround(1.0)) {
   if (i64toi32_i32$0 > Math_fround(0.0)) {
    $3 = ~~Math_fround(Math_min(Math_fround(Math_floor(Math_fround(i64toi32_i32$0 / Math_fround(4294967296.0)))), Math_fround(Math_fround(4294967296.0) - Math_fround(1.0)))) >>> 0
   } else {
    $3 = ~~Math_fround(Math_ceil(Math_fround(Math_fround(i64toi32_i32$0 - Math_fround(~~i64toi32_i32$0 >>> 0 >>> 0)) / Math_fround(4294967296.0)))) >>> 0
   }
   $4 = $3;
  } else {
   $4 = 0
  }
  i64toi32_i32$1 = $4;
  return (~~i64toi32_i32$0 >>> 0 | 0) == (0 | 0) & (i64toi32_i32$1 | 0) == (0 | 0) | 0 | 0;
 }
 
 function f45($0) {
  $0 = +$0;
  var i64toi32_i32$0 = 0.0, $3 = 0, $4 = 0, i64toi32_i32$1 = 0;
  i64toi32_i32$0 = $0;
  if (Math_abs(i64toi32_i32$0) >= 1.0) {
   if (i64toi32_i32$0 > 0.0) {
    $3 = ~~Math_min(Math_floor(i64toi32_i32$0 / 4294967296.0), 4294967296.0 - 1.0) >>> 0
   } else {
    $3 = ~~Math_ceil((i64toi32_i32$0 - +(~~i64toi32_i32$0 >>> 0 >>> 0)) / 4294967296.0) >>> 0
   }
   $4 = $3;
  } else {
   $4 = 0
  }
  i64toi32_i32$1 = $4;
  return (~~i64toi32_i32$0 >>> 0 | 0) == (0 | 0) & (i64toi32_i32$1 | 0) == (0 | 0) | 0 | 0;
 }
 
 function f46($0) {
  $0 = Math_fround($0);
  var i64toi32_i32$0 = Math_fround(0), $3 = 0, $4 = 0, i64toi32_i32$1 = 0;
  i64toi32_i32$0 = $0;
  if (Math_fround(Math_abs(i64toi32_i32$0)) >= Math_fround(1.0)) {
   if (i64toi32_i32$0 > Math_fround(0.0)) {
    $3 = ~~Math_fround(Math_min(Math_fround(Math_floor(Math_fround(i64toi32_i32$0 / Math_fround(4294967296.0)))), Math_fround(Math_fround(4294967296.0) - Math_fround(1.0)))) >>> 0
   } else {
    $3 = ~~Math_fround(Math_ceil(Math_fround(Math_fround(i64toi32_i32$0 - Math_fround(~~i64toi32_i32$0 >>> 0 >>> 0)) / Math_fround(4294967296.0)))) >>> 0
   }
   $4 = $3;
  } else {
   $4 = 0
  }
  i64toi32_i32$1 = $4;
  return (~~i64toi32_i32$0 >>> 0 | 0) == (0 | 0) & (i64toi32_i32$1 | 0) == (0 | 0) | 0 | 0;
 }
 
 function f47($0) {
  $0 = +$0;
  var i64toi32_i32$0 = 0.0, $3 = 0, $4 = 0, i64toi32_i32$1 = 0;
  i64toi32_i32$0 = $0;
  if (Math_abs(i64toi32_i32$0) >= 1.0) {
   if (i64toi32_i32$0 > 0.0) {
    $3 = ~~Math_min(Math_floor(i64toi32_i32$0 / 4294967296.0), 4294967296.0 - 1.0) >>> 0
   } else {
    $3 = ~~Math_ceil((i64toi32_i32$0 - +(~~i64toi32_i32$0 >>> 0 >>> 0)) / 4294967296.0) >>> 0
   }
   $4 = $3;
  } else {
   $4 = 0
  }
  i64toi32_i32$1 = $4;
  return (~~i64toi32_i32$0 >>> 0 | 0) == (0 | 0) & (i64toi32_i32$1 | 0) == (0 | 0) | 0 | 0;
 }
 
 function legalstub$f40($0, $1) {
  $0 = $0 | 0;
  $1 = $1 | 0;
  var i64toi32_i32$2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0, i64toi32_i32$4 = 0, i64toi32_i32$3 = 0, $10 = 0, $3 = 0, $3$hi = 0, $6$hi = 0;
  i64toi32_i32$0 = 0;
  $3 = $0;
  $3$hi = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$2 = $1;
  i64toi32_i32$1 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
   $10 = 0;
  } else {
   i64toi32_i32$1 = ((1 << i64toi32_i32$4 | 0) - 1 | 0) & (i64toi32_i32$2 >>> (32 - i64toi32_i32$4 | 0) | 0) | 0 | (i64toi32_i32$0 << i64toi32_i32$4 | 0) | 0;
   $10 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
  }
  $6$hi = i64toi32_i32$1;
  i64toi32_i32$1 = $3$hi;
  i64toi32_i32$0 = $3;
  i64toi32_i32$2 = $6$hi;
  i64toi32_i32$3 = $10;
  i64toi32_i32$2 = i64toi32_i32$1 | i64toi32_i32$2 | 0;
  return Math_fround(Math_fround(f40(i64toi32_i32$0 | i64toi32_i32$3 | 0 | 0, i64toi32_i32$2 | 0)));
 }
 
 function legalstub$f41($0, $1) {
  $0 = $0 | 0;
  $1 = $1 | 0;
  var i64toi32_i32$2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0, i64toi32_i32$4 = 0, i64toi32_i32$3 = 0, $10 = 0, $3 = 0, $3$hi = 0, $6$hi = 0;
  i64toi32_i32$0 = 0;
  $3 = $0;
  $3$hi = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$2 = $1;
  i64toi32_i32$1 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
   $10 = 0;
  } else {
   i64toi32_i32$1 = ((1 << i64toi32_i32$4 | 0) - 1 | 0) & (i64toi32_i32$2 >>> (32 - i64toi32_i32$4 | 0) | 0) | 0 | (i64toi32_i32$0 << i64toi32_i32$4 | 0) | 0;
   $10 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
  }
  $6$hi = i64toi32_i32$1;
  i64toi32_i32$1 = $3$hi;
  i64toi32_i32$0 = $3;
  i64toi32_i32$2 = $6$hi;
  i64toi32_i32$3 = $10;
  i64toi32_i32$2 = i64toi32_i32$1 | i64toi32_i32$2 | 0;
  return +(+f41(i64toi32_i32$0 | i64toi32_i32$3 | 0 | 0, i64toi32_i32$2 | 0));
 }
 
 function legalstub$f42($0, $1) {
  $0 = $0 | 0;
  $1 = $1 | 0;
  var i64toi32_i32$2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0, i64toi32_i32$4 = 0, i64toi32_i32$3 = 0, $10 = 0, $3 = 0, $3$hi = 0, $6$hi = 0;
  i64toi32_i32$0 = 0;
  $3 = $0;
  $3$hi = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$2 = $1;
  i64toi32_i32$1 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
   $10 = 0;
  } else {
   i64toi32_i32$1 = ((1 << i64toi32_i32$4 | 0) - 1 | 0) & (i64toi32_i32$2 >>> (32 - i64toi32_i32$4 | 0) | 0) | 0 | (i64toi32_i32$0 << i64toi32_i32$4 | 0) | 0;
   $10 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
  }
  $6$hi = i64toi32_i32$1;
  i64toi32_i32$1 = $3$hi;
  i64toi32_i32$0 = $3;
  i64toi32_i32$2 = $6$hi;
  i64toi32_i32$3 = $10;
  i64toi32_i32$2 = i64toi32_i32$1 | i64toi32_i32$2 | 0;
  return Math_fround(Math_fround(f42(i64toi32_i32$0 | i64toi32_i32$3 | 0 | 0, i64toi32_i32$2 | 0)));
 }
 
 function legalstub$f43($0, $1) {
  $0 = $0 | 0;
  $1 = $1 | 0;
  var i64toi32_i32$2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0, i64toi32_i32$4 = 0, i64toi32_i32$3 = 0, $10 = 0, $3 = 0, $3$hi = 0, $6$hi = 0;
  i64toi32_i32$0 = 0;
  $3 = $0;
  $3$hi = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$2 = $1;
  i64toi32_i32$1 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$1 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
   $10 = 0;
  } else {
   i64toi32_i32$1 = ((1 << i64toi32_i32$4 | 0) - 1 | 0) & (i64toi32_i32$2 >>> (32 - i64toi32_i32$4 | 0) | 0) | 0 | (i64toi32_i32$0 << i64toi32_i32$4 | 0) | 0;
   $10 = i64toi32_i32$2 << i64toi32_i32$4 | 0;
  }
  $6$hi = i64toi32_i32$1;
  i64toi32_i32$1 = $3$hi;
  i64toi32_i32$0 = $3;
  i64toi32_i32$2 = $6$hi;
  i64toi32_i32$3 = $10;
  i64toi32_i32$2 = i64toi32_i32$1 | i64toi32_i32$2 | 0;
  return +(+f43(i64toi32_i32$0 | i64toi32_i32$3 | 0 | 0, i64toi32_i32$2 | 0));
 }
 
 return {
  "f32_add": f0, 
  "f32_sub": f1, 
  "f32_mul": f2, 
  "f32_div": f3, 
  "f64_add": f4, 
  "f64_sub": f5, 
  "f64_mul": f6, 
  "f64_div": f7, 
  "f32_eq": f8, 
  "f32_ne": f9, 
  "f32_ge": f10, 
  "f32_gt": f11, 
  "f32_le": f12, 
  "f32_lt": f13, 
  "f64_eq": f14, 
  "f64_ne": f15, 
  "f64_ge": f16, 
  "f64_gt": f17, 
  "f64_le": f18, 
  "f64_lt": f19, 
  "f32_min": f20, 
  "f32_max": f21, 
  "f64_min": f22, 
  "f64_max": f23, 
  "f64_promote": f24, 
  "f32_demote": f25, 
  "f32_floor": f26, 
  "f32_ceil": f27, 
  "f64_floor": f28, 
  "f64_ceil": f29, 
  "f32_sqrt": f30, 
  "f64_sqrt": f31, 
  "i32_to_f32": f32, 
  "i32_to_f64": f33, 
  "u32_to_f32": f34, 
  "u32_to_f64": f35, 
  "f32_to_i32": f36, 
  "f64_to_i32": f37, 
  "f32_to_u32": f38, 
  "f64_to_u32": f39, 
  "i64_to_f32": legalstub$f40, 
  "i64_to_f64": legalstub$f41, 
  "u64_to_f32": legalstub$f42, 
  "u64_to_f64": legalstub$f43, 
  "f32_to_i64": f44, 
  "f64_to_i64": f45, 
  "f32_to_u64": f46, 
  "f64_to_u64": f47
 };
}

var retasmFunc = asmFunc({
});
export var f32_add = retasmFunc.f32_add;
export var f32_sub = retasmFunc.f32_sub;
export var f32_mul = retasmFunc.f32_mul;
export var f32_div = retasmFunc.f32_div;
export var f64_add = retasmFunc.f64_add;
export var f64_sub = retasmFunc.f64_sub;
export var f64_mul = retasmFunc.f64_mul;
export var f64_div = retasmFunc.f64_div;
export var f32_eq = retasmFunc.f32_eq;
export var f32_ne = retasmFunc.f32_ne;
export var f32_ge = retasmFunc.f32_ge;
export var f32_gt = retasmFunc.f32_gt;
export var f32_le = retasmFunc.f32_le;
export var f32_lt = retasmFunc.f32_lt;
export var f64_eq = retasmFunc.f64_eq;
export var f64_ne = retasmFunc.f64_ne;
export var f64_ge = retasmFunc.f64_ge;
export var f64_gt = retasmFunc.f64_gt;
export var f64_le = retasmFunc.f64_le;
export var f64_lt = retasmFunc.f64_lt;
export var f32_min = retasmFunc.f32_min;
export var f32_max = retasmFunc.f32_max;
export var f64_min = retasmFunc.f64_min;
export var f64_max = retasmFunc.f64_max;
export var f64_promote = retasmFunc.f64_promote;
export var f32_demote = retasmFunc.f32_demote;
export var f32_floor = retasmFunc.f32_floor;
export var f32_ceil = retasmFunc.f32_ceil;
export var f64_floor = retasmFunc.f64_floor;
export var f64_ceil = retasmFunc.f64_ceil;
export var f32_sqrt = retasmFunc.f32_sqrt;
export var f64_sqrt = retasmFunc.f64_sqrt;
export var i32_to_f32 = retasmFunc.i32_to_f32;
export var i32_to_f64 = retasmFunc.i32_to_f64;
export var u32_to_f32 = retasmFunc.u32_to_f32;
export var u32_to_f64 = retasmFunc.u32_to_f64;
export var f32_to_i32 = retasmFunc.f32_to_i32;
export var f64_to_i32 = retasmFunc.f64_to_i32;
export var f32_to_u32 = retasmFunc.f32_to_u32;
export var f64_to_u32 = retasmFunc.f64_to_u32;
export var i64_to_f32 = retasmFunc.i64_to_f32;
export var i64_to_f64 = retasmFunc.i64_to_f64;
export var u64_to_f32 = retasmFunc.u64_to_f32;
export var u64_to_f64 = retasmFunc.u64_to_f64;
export var f32_to_i64 = retasmFunc.f32_to_i64;
export var f64_to_i64 = retasmFunc.f64_to_i64;
export var f32_to_u64 = retasmFunc.f32_to_u64;
export var f64_to_u64 = retasmFunc.f64_to_u64;
