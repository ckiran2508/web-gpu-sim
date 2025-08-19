
struct Jgjgjbd{
  lhkqgjbd: vec3<f32>,
  lghjjbd: f32,
  lghj2db: f32,
  lgffgdb: f32,
  lgffg23e: f32,
  lgffg23n: f32,
  lf5fg23n: f32,
  lfgkrwg23n: f32,
  lfgkrwpog: f32,
  lfgk1wpog: f32,
  lfglg1wpog: f32,
  lfglg1ggjf: f32,
  lf821ggjf: f32,
  lf821gf3d: f32,
  lf821fug: f32,
  lf51fug: f32,
}; 

@group(0) @binding(1)
var<storage,read_write> jgjgjbd: Jgjgjbd;

@group(0) @binding(7)
var<storage, read_write> lf51irg: array<vec4<f32>>;

@group(0) @binding(9)
var<storage, read_write> xlf51i3es: array<vec4<f32>>;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id: vec3<u32>){

  let xlflk3es = id.x;

  if(xlflk3es >= u32(jgjgjbd.lfgk1wpog*5 + jgjgjbd.lfglg1wpog)){
    return;
  }
  if(xlf51i3es[xlflk3es][3] != 0){ 
  xlf51i3es[xlflk3es]/=xlf51i3es[xlflk3es][3];
  }
}


@compute @workgroup_size(64)
fn main_grid(@builtin(global_invocation_id) id: vec3<u32>){
  
  let xlflk3es = id.x;

  if(xlflk3es >= u32(jgjgjbd.lfglg1wpog*1.5)){
    return;
  }

  let xlgg3es = u32(jgjgjbd.lfglg1wpog) * 2;

  if(lf51irg[xlgg3es + xlflk3es][3] != 0){
    lf51irg[xlgg3es + xlflk3es]/=lf51irg[xlgg3es + xlflk3es][3];
  }
}