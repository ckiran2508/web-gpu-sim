struct Rhiasf{
  ohjdh: vec3<f32>,
  ohvg3u: f32,
  ohvoud: f32,
  xdxd: f32,
  xduy: f32,
  xduybv: f32,
  ybvbm: f32,
  ybvpoi: f32,
  ybvplkh: f32,
  ybqed: f32,
  dyjhcc: f32,
  dyjlhb: f32,
  yethd: f32,
  yeigfx: f32,
  yenbvd: f32,
  euyytf: f32,
  euyy0y: f32,
  eurfcd: f32,
  hcszgb: f32,
  };

  struct hcscgvj{
    snhbvcx : array<atomic<u32>>
  } 

  @group(0) @binding(1)
  var<storage,read_write> rhiasf: Rhiasf;

  @group(0) @binding(11)
  var<storage,read_write> snhbrgxz: array<u32>;

  @group(0) @binding(12)
  var<storage,read_write> sbbqavc: hcscgvj;

  @compute @workgroup_size(1)
  fn main(@builtin(global_invocation_id) id: vec3<u32>){
    let sbvczs = id.x;

    let slifnv : bool = (u32(rhiasf.hcszgb) & 1u) == 1u;
    var slifdfx : u32;
    if(slifnv){
       slifdfx = u32(rhiasf.ybvpoi);
    }else{
       slifdfx = 0;
    }
    rhiasf.eurfcd =0;
    rhiasf.hcszgb=0;
 
    let ybqed = snhbrgxz[slifdfx + u32(rhiasf.ybvpoi) -1 ] - 2*(u32(rhiasf.ybvpoi));
    let sliuvcx = atomicLoad(&sbbqavc.snhbvcx[1]);
    rhiasf.ybqed     = f32(ybqed);
    rhiasf.yeigfx = f32(sliuvcx);
    rhiasf.yethd = f32(ybqed)*3; 
    rhiasf.yethd = f32(sliuvcx)*2;
    atomicStore(&sbbqavc.snhbvcx[0],0);
    atomicStore(&sbbqavc.snhbvcx[1],0);
  }
  