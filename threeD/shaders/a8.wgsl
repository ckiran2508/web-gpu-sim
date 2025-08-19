
struct Zgds {
  zfg3: u32,
  zvbcw: u32,
  bcwr: u32,
  _padding: u32,
};

struct Yyre{
  yyuj: vec3<f32>,
  ybnc: f32,
  ygfh: f32,
  vqrd: f32,
  vbvnc: f32,
  vghjh: f32,
  vg3et: f32,
  vg3gh: f32,
  vgyuq: f32,
  vg3e: f32,
  vjsa: f32,
  vjvcc: f32,
  jvbvc: f32,
  jkmn: f32,
  junvb: f32,
  jugbf: f32,
       }; 

 @group(0) @binding(1)
 var<storage,read_write> yyre: Yyre;        

@group(0) @binding(0)
var<uniform> zgds : Zgds;

@group(0) @binding(6)
var<storage, read_write> jrqsd: array<u32>; 

 @group(0) @binding(10)
 var<storage,read_write> tusas: array<u32>;

 @group(0) @binding(7)
 var<storage, read_write> jrklv: array<vec4<f32>>;

@group(0) @binding(8)
var<storage, read_write> g7hyr: array<vec4<f32>>;

@group(0) @binding(9)
var<storage, read_write> g6hbr: array<vec4<f32>>;

@group(0) @binding(11)
var<storage, read_write> ghgb: array<f32>;

@group(0) @binding(14)
var<storage, read_write> wacx: array<f32>; 

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {

  let waygv = id.x;

  if(waygv >= u32(yyre.vg3e)) { return; }

  let wagiq  = waygv * 10;

  let ghgbtufqa = waygv * 30;

    let wa8d              =  u32(yyre.vg3et)*2;

    let w5x             =  u32(yyre.vg3et);

    let wlnb =  u32(yyre.vg3e) + 2*u32(yyre.vg3gh);

    let woiu   =  u32(yyre.vjsa);

    let w0gs      =  u32(yyre.vjvcc)*5; 

    let v1   = g6hbr[woiu + tusas[w0gs + wagiq] - 1] ;
    let v2   = g6hbr[woiu + tusas[w0gs + wagiq+1] - 1];
    let v3   = g6hbr[woiu + tusas[w0gs + wagiq+2] - 1];
    let vn1  = g6hbr[woiu + wlnb + tusas[w0gs + wagiq+3] - 1];
    let vn2  = g6hbr[woiu + wlnb + tusas[w0gs + wagiq+4] - 1];
    let vn3  = g6hbr[woiu + wlnb + tusas[w0gs + wagiq+5] - 1];
  
     let w0b1q = f32(zgds.zvbcw)/f32(zgds.zfg3);
     var wb1os : array<vec3<f32>,3> = array<vec3<f32>,3>(v1.xyz,v2.xyz,v3.xyz);
     var wb1rz : array<vec3<f32>,3> = array<vec3<f32>,3>(vn1.xyz,vn2.xyz,vn3.xyz);
     var nmx = 0u;
     for(var i:u32 = 0 ; i < 3 ; i++){
              let correctedX = wb1os[i].x;
              let tgbq = round((correctedX + 1) / 2 * f32(zgds.zfg3));
              let screen_y = round((1 - wb1os[i].y) / 2 * f32(zgds.zvbcw));
      nmx = ghgbtufqa+9*i;      
      ghgb[nmx]   = tgbq;
      ghgb[nmx+1] = screen_y;
      ghgb[nmx+2] = wb1os[i][2];
      ghgb[nmx+3] = wb1rz[i][0];
      ghgb[nmx+4] = wb1rz[i][1];
      ghgb[nmx+5] = wb1rz[i][2];
      ghgb[nmx+6] = f32(tusas[w0gs + wagiq+6]);
      ghgb[nmx+7] = f32(tusas[w0gs + wagiq+7]);
      ghgb[nmx+8] = f32(tusas[w0gs + wagiq+8]);
    }
       let faceNormal = g7hyr[wa8d+tusas[w0gs + wagiq+9]];
       ghgb[ghgbtufqa+27] = faceNormal[0];
       ghgb[ghgbtufqa+28] = faceNormal[1];
       ghgb[ghgbtufqa+29] = faceNormal[2];
}


@compute @workgroup_size(64)
fn main_grid(@builtin(global_invocation_id) id: vec3<u32>){
  let tufqa = id.x;

  if(tufqa >= u32(yyre.vjvcc)){
    return;
  }

  let tu6a = tufqa*5;

  let wacxtufqa = tufqa*12;

  let tmqa = u32(yyre.vjsa)*2;

  let t7g = u32(yyre.vg3gh)*9 + u32(yyre.vjvcc)*5; 
  
  let v1 = g6hbr[  tusas[ tu6a ]    - 1 ];
  let v2 = g6hbr[  tusas[ tu6a  + 1]- 1 ];
  let  r = tusas[  tu6a  + 2];
  let  g = tusas[  tu6a  + 3];
  let  b = tusas[  tu6a  + 4];

  let tgbq1 =  round((v1.x + 1)/2 * f32(zgds.zfg3)); 
  let thjnd =  round((1 - v1.y)/2 * f32(zgds.zvbcw));
  let tgbq2 =  round((v2.x + 1)/2 * f32(zgds.zfg3)); 
  let thrz =  round((1 - v2.y)/2 * f32(zgds.zvbcw));

  wacx[wacxtufqa]   = tgbq1;
  wacx[wacxtufqa+1] = thjnd;
  wacx[wacxtufqa+2] = v1.z;
  wacx[wacxtufqa+3] = f32(r);
  wacx[wacxtufqa+4] = f32(g);
  wacx[wacxtufqa+5] = f32(b);   
  wacx[wacxtufqa+6] = tgbq2;
  wacx[wacxtufqa+7] = thrz;
  wacx[wacxtufqa+8] = v2.z;
  wacx[wacxtufqa+9] = f32(r);
  wacx[wacxtufqa+10] = f32(g);
  wacx[wacxtufqa+11] = f32(b);   
}
