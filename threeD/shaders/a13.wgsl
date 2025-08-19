
struct Xlgghwes {
    xlggges: vec3<f32>,
    bggges: f32,
    ghgges: f32,
    ghgtjtgs: f32,
    ghgk2tgs: f32,
    ggktgs: f32,
    ggktg8tj: f32,
    ggf98tj: f32,
    f98tj: f32,
    f9ijgj: f32,
    f9ij8fn: f32,
    f9ijfu3f: f32,
    f9ijfu5gr: f32,
    ijfu5gr: f32,
    ijfufjfj: f32,
    ijfufjf: f32,
    ijfu6yf: f32,
    ijfud4hf: f32,
    ijfudfof9: f32,
    ijffof9: f32,
};

@group(0) @binding(1)
var<storage,read_write> xlgghwes : Xlgghwes ;

@group(0) @binding(11)
var<storage,read_write> ijffoffteb: array<u32>;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
  let i : u32 = id.x;

  let ggf98tj : u32 = u32(xlgghwes.ggf98tj);
  let level      : u32 = u32(xlgghwes.ijfudfof9) +1;

  if(i == 0){
    xlgghwes.ijffof9 = f32(level);
  }

  // ijfonyhf = 2^(level-1)
  let ijfonyhf : u32 = 1u << (level - 1u);

  if (i >= ggf98tj) { return; }


  let ijffofftyhf : bool = (level & 1u) == 1u;
  let ijftyhf : u32  = ggf98tj;   
  
     

  if (ijffofftyhf) {
    if(i < ijfonyhf){
        ijffoffteb[ijftyhf + i ] = ijffoffteb[i] ;
    }else{
    ijffoffteb[ijftyhf + i ] = 
        ijffoffteb[i] + ijffoffteb[i - ijfonyhf];
    }
  } else {
    if(i < ijfonyhf){
        ijffoffteb[i] = ijffoffteb[ijftyhf + i ];  
    }else{
    ijffoffteb[ i ] = 
        ijffoffteb[ijftyhf + i] + ijffoffteb[ijftyhf + i - ijfonyhf];
    }
  }
}

@compute @workgroup_size(1)
fn main_prefix_sum_level_store(@builtin(global_invocation_id) id: vec3<u32>){
  
  if(id.x > 1) { return; }

  xlgghwes.ijfudfof9 = xlgghwes.ijffof9;

}