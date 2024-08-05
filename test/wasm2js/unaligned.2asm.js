import * as env from 'env';

  var bufferView;

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
 var buffer = new ArrayBuffer(65536);
 var HEAP8 = new Int8Array(buffer);
 var HEAP16 = new Int16Array(buffer);
 var HEAP32 = new Int32Array(buffer);
 var HEAPU8 = new Uint8Array(buffer);
 var HEAPU16 = new Uint16Array(buffer);
 var HEAPU32 = new Uint32Array(buffer);
 var HEAPF32 = new Float32Array(buffer);
 var HEAPF64 = new Float64Array(buffer);
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
 var env = imports.env;
 var setTempRet0 = env.setTempRet0;
 var i64toi32_i32$HIGH_BITS = 0;
 function f0() {
  var $0 = 0;
  $0 = 0;
  return HEAPU8[$0 >> 0] | 0 | ((HEAPU8[($0 + 1 | 0) >> 0] | 0) << 8 | 0) | 0 | ((HEAPU8[($0 + 2 | 0) >> 0] | 0) << 16 | 0 | ((HEAPU8[($0 + 3 | 0) >> 0] | 0) << 24 | 0) | 0) | 0 | 0;
 }
 
 function f1() {
  var $2 = 0, i64toi32_i32$0 = 0, i64toi32_i32$1 = 0;
  $2 = 0;
  i64toi32_i32$0 = HEAPU8[$2 >> 0] | 0 | ((HEAPU8[($2 + 1 | 0) >> 0] | 0) << 8 | 0) | 0 | ((HEAPU8[($2 + 2 | 0) >> 0] | 0) << 16 | 0 | ((HEAPU8[($2 + 3 | 0) >> 0] | 0) << 24 | 0) | 0) | 0;
  i64toi32_i32$1 = HEAPU8[($2 + 4 | 0) >> 0] | 0 | ((HEAPU8[($2 + 5 | 0) >> 0] | 0) << 8 | 0) | 0 | ((HEAPU8[($2 + 6 | 0) >> 0] | 0) << 16 | 0 | ((HEAPU8[($2 + 7 | 0) >> 0] | 0) << 24 | 0) | 0) | 0;
  i64toi32_i32$HIGH_BITS = i64toi32_i32$1;
  return i64toi32_i32$0 | 0;
 }
 
 function f2() {
  var $0 = 0;
  $0 = 0;
  return Math_fround((wasm2js_scratch_store_i32(2, HEAPU8[$0 >> 0] | 0 | ((HEAPU8[($0 + 1 | 0) >> 0] | 0) << 8 | 0) | 0 | ((HEAPU8[($0 + 2 | 0) >> 0] | 0) << 16 | 0 | ((HEAPU8[($0 + 3 | 0) >> 0] | 0) << 24 | 0) | 0) | 0), wasm2js_scratch_load_f32()));
 }
 
 function f3() {
  var $1 = 0, i64toi32_i32$1 = 0;
  $1 = 0;
  i64toi32_i32$1 = HEAPU8[($1 + 4 | 0) >> 0] | 0 | ((HEAPU8[($1 + 5 | 0) >> 0] | 0) << 8 | 0) | 0 | ((HEAPU8[($1 + 6 | 0) >> 0] | 0) << 16 | 0 | ((HEAPU8[($1 + 7 | 0) >> 0] | 0) << 24 | 0) | 0) | 0;
  wasm2js_scratch_store_i32(0 | 0, HEAPU8[$1 >> 0] | 0 | ((HEAPU8[($1 + 1 | 0) >> 0] | 0) << 8 | 0) | 0 | ((HEAPU8[($1 + 2 | 0) >> 0] | 0) << 16 | 0 | ((HEAPU8[($1 + 3 | 0) >> 0] | 0) << 24 | 0) | 0) | 0 | 0);
  wasm2js_scratch_store_i32(1 | 0, i64toi32_i32$1 | 0);
  return +(+wasm2js_scratch_load_f64());
 }
 
 function f4() {
  var $0 = 0, $1 = 0;
  $0 = 0;
  $1 = 0;
  HEAP8[$0 >> 0] = $1;
  HEAP8[($0 + 1 | 0) >> 0] = $1 >>> 8 | 0;
  HEAP8[($0 + 2 | 0) >> 0] = $1 >>> 16 | 0;
  HEAP8[($0 + 3 | 0) >> 0] = $1 >>> 24 | 0;
 }
 
 function f5() {
  var $0 = 0, $1 = 0, $2 = 0;
  $0 = 0;
  $1 = 0;
  HEAP8[$0 >> 0] = $1;
  HEAP8[($0 + 1 | 0) >> 0] = $1 >>> 8 | 0;
  HEAP8[($0 + 2 | 0) >> 0] = $1 >>> 16 | 0;
  HEAP8[($0 + 3 | 0) >> 0] = $1 >>> 24 | 0;
  $2 = 0;
  HEAP8[($0 + 4 | 0) >> 0] = $2;
  HEAP8[($0 + 5 | 0) >> 0] = $2 >>> 8 | 0;
  HEAP8[($0 + 6 | 0) >> 0] = $2 >>> 16 | 0;
  HEAP8[($0 + 7 | 0) >> 0] = $2 >>> 24 | 0;
 }
 
 function f6() {
  var $0 = 0, $1 = 0;
  $0 = 0;
  $1 = (wasm2js_scratch_store_f32(Math_fround(0.0)), wasm2js_scratch_load_i32(2));
  HEAP8[$0 >> 0] = $1;
  HEAP8[($0 + 1 | 0) >> 0] = $1 >>> 8 | 0;
  HEAP8[($0 + 2 | 0) >> 0] = $1 >>> 16 | 0;
  HEAP8[($0 + 3 | 0) >> 0] = $1 >>> 24 | 0;
 }
 
 function f7() {
  var $1 = 0, $2 = 0, $3 = 0, i64toi32_i32$0 = 0;
  wasm2js_scratch_store_f64(+(0.0));
  i64toi32_i32$0 = wasm2js_scratch_load_i32(1 | 0) | 0;
  $1 = 0;
  $2 = wasm2js_scratch_load_i32(0 | 0) | 0;
  HEAP8[$1 >> 0] = $2;
  HEAP8[($1 + 1 | 0) >> 0] = $2 >>> 8 | 0;
  HEAP8[($1 + 2 | 0) >> 0] = $2 >>> 16 | 0;
  HEAP8[($1 + 3 | 0) >> 0] = $2 >>> 24 | 0;
  $3 = i64toi32_i32$0;
  HEAP8[($1 + 4 | 0) >> 0] = $3;
  HEAP8[($1 + 5 | 0) >> 0] = $3 >>> 8 | 0;
  HEAP8[($1 + 6 | 0) >> 0] = $3 >>> 16 | 0;
  HEAP8[($1 + 7 | 0) >> 0] = $3 >>> 24 | 0;
 }
 
 function legalstub$f1() {
  var i64toi32_i32$0 = 0, i64toi32_i32$4 = 0, i64toi32_i32$1 = 0, i64toi32_i32$3 = 0, $7 = 0, $0 = 0, $0$hi = 0, i64toi32_i32$2 = 0;
  i64toi32_i32$0 = f1() | 0;
  i64toi32_i32$1 = i64toi32_i32$HIGH_BITS;
  $0 = i64toi32_i32$0;
  $0$hi = i64toi32_i32$1;
  i64toi32_i32$2 = i64toi32_i32$0;
  i64toi32_i32$0 = 0;
  i64toi32_i32$3 = 32;
  i64toi32_i32$4 = i64toi32_i32$3 & 31 | 0;
  if (32 >>> 0 <= (i64toi32_i32$3 & 63 | 0) >>> 0) {
   i64toi32_i32$0 = 0;
   $7 = i64toi32_i32$1 >>> i64toi32_i32$4 | 0;
  } else {
   i64toi32_i32$0 = i64toi32_i32$1 >>> i64toi32_i32$4 | 0;
   $7 = (((1 << i64toi32_i32$4 | 0) - 1 | 0) & i64toi32_i32$1 | 0) << (32 - i64toi32_i32$4 | 0) | 0 | (i64toi32_i32$2 >>> i64toi32_i32$4 | 0) | 0;
  }
  setTempRet0($7 | 0);
  i64toi32_i32$0 = $0$hi;
  return $0 | 0;
 }
 
 bufferView = HEAPU8;
 function __wasm_memory_size() {
  return buffer.byteLength / 65536 | 0;
 }
 
 return {
  "i32_load": f0, 
  "i64_load": legalstub$f1, 
  "f32_load": f2, 
  "f64_load": f3, 
  "i32_store": f4, 
  "i64_store": f5, 
  "f32_store": f6, 
  "f64_store": f7
 };
}

var retasmFunc = asmFunc({
  "env": env,
});
export var i32_load = retasmFunc.i32_load;
export var i64_load = retasmFunc.i64_load;
export var f32_load = retasmFunc.f32_load;
export var f64_load = retasmFunc.f64_load;
export var i32_store = retasmFunc.i32_store;
export var i64_store = retasmFunc.i64_store;
export var f32_store = retasmFunc.f32_store;
export var f64_store = retasmFunc.f64_store;
