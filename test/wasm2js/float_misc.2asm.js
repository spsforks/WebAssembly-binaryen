

  var scratchBuffer = new ArrayBuffer(16);
  var i32ScratchView = new Int32Array(scratchBuffer);
  var f32ScratchView = new Float32Array(scratchBuffer);
  var f64ScratchView = new Float64Array(scratchBuffer);
  
  function wasm2js_scratch_load_i32(index) {
    return i32ScratchView[index];
  }
      
  function wasm2js_scratch_store_i32(index, value) {
    i32ScratchView[index] = value;
  }
      
  function wasm2js_scratch_load_f64() {
    return f64ScratchView[0];
  }
      
  function wasm2js_scratch_store_f64(value) {
    f64ScratchView[0] = value;
  }
      
  function wasm2js_scratch_load_f32() {
    return f32ScratchView[2];
  }
      
  function wasm2js_scratch_store_f32(value) {
    f32ScratchView[2] = value;
  }
      
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
 function f0(x, y) {
  x = Math_fround(x);
  y = Math_fround(y);
  return Math_fround(Math_fround(x + y));
 }
 
 function f1(x, y) {
  x = Math_fround(x);
  y = Math_fround(y);
  return Math_fround(Math_fround(x - y));
 }
 
 function f2(x, y) {
  x = Math_fround(x);
  y = Math_fround(y);
  return Math_fround(Math_fround(x * y));
 }
 
 function f3(x, y) {
  x = Math_fround(x);
  y = Math_fround(y);
  return Math_fround(Math_fround(x / y));
 }
 
 function f4(x) {
  x = Math_fround(x);
  return Math_fround(Math_fround(Math_sqrt(x)));
 }
 
 function f5(x) {
  x = Math_fround(x);
  return Math_fround(Math_fround(Math_abs(x)));
 }
 
 function f6(x) {
  x = Math_fround(x);
  return Math_fround(Math_fround(-x));
 }
 
 function f7(x, y) {
  x = Math_fround(x);
  y = Math_fround(y);
  return Math_fround((wasm2js_scratch_store_i32(2, (wasm2js_scratch_store_f32(x), wasm2js_scratch_load_i32(2)) & 2147483647 | 0 | ((wasm2js_scratch_store_f32(y), wasm2js_scratch_load_i32(2)) & -2147483648 | 0) | 0), wasm2js_scratch_load_f32()));
 }
 
 function f8(x) {
  x = Math_fround(x);
  return Math_fround(Math_fround(Math_ceil(x)));
 }
 
 function f9(x) {
  x = Math_fround(x);
  return Math_fround(Math_fround(Math_floor(x)));
 }
 
 function f10(x) {
  x = Math_fround(x);
  return Math_fround(Math_fround(Math_trunc(x)));
 }
 
 function f11(x) {
  x = Math_fround(x);
  return Math_fround(Math_fround(__wasm_nearest_f32(Math_fround(x))));
 }
 
 function f12(x, y) {
  x = Math_fround(x);
  y = Math_fround(y);
  return Math_fround(Math_fround(Math_min(x, y)));
 }
 
 function f13(x, y) {
  x = Math_fround(x);
  y = Math_fround(y);
  return Math_fround(Math_fround(Math_max(x, y)));
 }
 
 function f14(x, y) {
  x = +x;
  y = +y;
  return +(x + y);
 }
 
 function f15(x, y) {
  x = +x;
  y = +y;
  return +(x - y);
 }
 
 function f16(x, y) {
  x = +x;
  y = +y;
  return +(x * y);
 }
 
 function f17(x, y) {
  x = +x;
  y = +y;
  return +(x / y);
 }
 
 function f18(x) {
  x = +x;
  return +Math_sqrt(x);
 }
 
 function f19(x) {
  x = +x;
  return +Math_abs(x);
 }
 
 function f20(x) {
  x = +x;
  return +-x;
 }
 
 function f21(x, y) {
  x = +x;
  y = +y;
  var i64toi32_i32$0 = 0, i64toi32_i32$2 = 0, i64toi32_i32$1 = 0, i64toi32_i32$3 = 0, $4 = 0, $4$hi = 0, $7 = 0, $7$hi = 0;
  wasm2js_scratch_store_f64(+x);
  i64toi32_i32$0 = wasm2js_scratch_load_i32(1 | 0) | 0;
  i64toi32_i32$2 = wasm2js_scratch_load_i32(0 | 0) | 0;
  i64toi32_i32$1 = 2147483647;
  i64toi32_i32$3 = -1;
  i64toi32_i32$1 = i64toi32_i32$0 & i64toi32_i32$1 | 0;
  $4 = i64toi32_i32$2 & i64toi32_i32$3 | 0;
  $4$hi = i64toi32_i32$1;
  wasm2js_scratch_store_f64(+y);
  i64toi32_i32$1 = wasm2js_scratch_load_i32(1 | 0) | 0;
  i64toi32_i32$0 = wasm2js_scratch_load_i32(0 | 0) | 0;
  i64toi32_i32$2 = -2147483648;
  i64toi32_i32$3 = 0;
  i64toi32_i32$2 = i64toi32_i32$1 & i64toi32_i32$2 | 0;
  $7 = i64toi32_i32$0 & i64toi32_i32$3 | 0;
  $7$hi = i64toi32_i32$2;
  i64toi32_i32$2 = $4$hi;
  i64toi32_i32$1 = $4;
  i64toi32_i32$0 = $7$hi;
  i64toi32_i32$3 = $7;
  i64toi32_i32$0 = i64toi32_i32$2 | i64toi32_i32$0 | 0;
  wasm2js_scratch_store_i32(0 | 0, i64toi32_i32$1 | i64toi32_i32$3 | 0 | 0);
  wasm2js_scratch_store_i32(1 | 0, i64toi32_i32$0 | 0);
  return +(+wasm2js_scratch_load_f64());
 }
 
 function f22(x) {
  x = +x;
  return +Math_ceil(x);
 }
 
 function f23(x) {
  x = +x;
  return +Math_floor(x);
 }
 
 function f24(x) {
  x = +x;
  return +Math_trunc(x);
 }
 
 function f25(x) {
  x = +x;
  return +(+__wasm_nearest_f64(+x));
 }
 
 function f26(x, y) {
  x = +x;
  y = +y;
  return +Math_min(x, y);
 }
 
 function f27(x, y) {
  x = +x;
  y = +y;
  return +Math_max(x, y);
 }
 
 function __wasm_nearest_f32(var$0) {
  var$0 = Math_fround(var$0);
  var var$1 = Math_fround(0), var$2 = Math_fround(0);
  var$1 = Math_fround(Math_floor(var$0));
  var$2 = Math_fround(var$0 - var$1);
  if (!(var$2 < Math_fround(.5))) {
   var$0 = Math_fround(Math_ceil(var$0));
   if (var$2 > Math_fround(.5)) {
    return Math_fround(var$0)
   }
   var$2 = Math_fround(var$1 * Math_fround(.5));
   var$1 = Math_fround(var$2 - Math_fround(Math_floor(var$2))) == Math_fround(0.0) ? var$1 : var$0;
  }
  return Math_fround(var$1);
 }
 
 function __wasm_nearest_f64(var$0) {
  var$0 = +var$0;
  var var$1 = 0.0, var$2 = 0.0;
  var$1 = Math_floor(var$0);
  var$2 = var$0 - var$1;
  if (!(var$2 < .5)) {
   var$0 = Math_ceil(var$0);
   if (var$2 > .5) {
    return +var$0
   }
   var$2 = var$1 * .5;
   var$1 = var$2 - Math_floor(var$2) == 0.0 ? var$1 : var$0;
  }
  return +var$1;
 }
 
 return {
  "f32_add": f0, 
  "f32_sub": f1, 
  "f32_mul": f2, 
  "f32_div": f3, 
  "f32_sqrt": f4, 
  "f32_abs": f5, 
  "f32_neg": f6, 
  "f32_copysign": f7, 
  "f32_ceil": f8, 
  "f32_floor": f9, 
  "f32_trunc": f10, 
  "f32_nearest": f11, 
  "f32_min": f12, 
  "f32_max": f13, 
  "f64_add": f14, 
  "f64_sub": f15, 
  "f64_mul": f16, 
  "f64_div": f17, 
  "f64_sqrt": f18, 
  "f64_abs": f19, 
  "f64_neg": f20, 
  "f64_copysign": f21, 
  "f64_ceil": f22, 
  "f64_floor": f23, 
  "f64_trunc": f24, 
  "f64_nearest": f25, 
  "f64_min": f26, 
  "f64_max": f27
 };
}

var retasmFunc = asmFunc({
});
export var f32_add = retasmFunc.f32_add;
export var f32_sub = retasmFunc.f32_sub;
export var f32_mul = retasmFunc.f32_mul;
export var f32_div = retasmFunc.f32_div;
export var f32_sqrt = retasmFunc.f32_sqrt;
export var f32_abs = retasmFunc.f32_abs;
export var f32_neg = retasmFunc.f32_neg;
export var f32_copysign = retasmFunc.f32_copysign;
export var f32_ceil = retasmFunc.f32_ceil;
export var f32_floor = retasmFunc.f32_floor;
export var f32_trunc = retasmFunc.f32_trunc;
export var f32_nearest = retasmFunc.f32_nearest;
export var f32_min = retasmFunc.f32_min;
export var f32_max = retasmFunc.f32_max;
export var f64_add = retasmFunc.f64_add;
export var f64_sub = retasmFunc.f64_sub;
export var f64_mul = retasmFunc.f64_mul;
export var f64_div = retasmFunc.f64_div;
export var f64_sqrt = retasmFunc.f64_sqrt;
export var f64_abs = retasmFunc.f64_abs;
export var f64_neg = retasmFunc.f64_neg;
export var f64_copysign = retasmFunc.f64_copysign;
export var f64_ceil = retasmFunc.f64_ceil;
export var f64_floor = retasmFunc.f64_floor;
export var f64_trunc = retasmFunc.f64_trunc;
export var f64_nearest = retasmFunc.f64_nearest;
export var f64_min = retasmFunc.f64_min;
export var f64_max = retasmFunc.f64_max;
