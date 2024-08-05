
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
 function f0($0) {
  $0 = $0 | 0;
  return (($0 | 0) < (0 | 0) ? -1 : ($0 | 0) > (0 | 0) ? 1 : 0) | 0;
 }
 
 return {
  "sign": f0
 };
}

var retasmFunc = asmFunc({
});
export var sign = retasmFunc.sign;
