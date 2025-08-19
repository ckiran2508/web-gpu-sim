struct Rhfndg{
    rdfghrts: vec3<f32>,
    gwfd3fs: f32,
    gpfhd3fs: f32,
    ehfgss: f32,
    ehorhvb: f32,
    ehorpghfb: f32,
    ehorqydva: f32,
    ehorqvhf: f32,
    yednf: f32,
    yephfb: f32,
    yefpehfb: f32,
    hkshfb: f32,
    hkwpdhf: f32,
    hkwp39fh: f32,
    hkwpfuwg: f32,
    hkwp3fgah: f32,
    wprpghs: f32,
    wpjrfb: f32,
    wpfrw2d: f32,
    }; 
 
       struct Ijbsf{
     jfjghe : array<atomic<u32>>
   }     
 
    struct Kjfe{
       a: vec4<f32>,
       b: vec4<f32>
    }
 
     @group(0) @binding(1)
     var<storage,read_write> rhfndg: Rhfndg;
     
     @group(0) @binding(6)
     var<storage, read_write> rfbs: array<u32>; 
    
     @group(0) @binding(7)
     var<storage, read_write> rfjsdnf: array<vec4<f32>>;
 
     @group(0) @binding(8)
     var<storage, read_write> rfjsprgh: array<vec4<f32>>;
 
     @group(0) @binding(9)
     var<storage, read_write> reufgs: array<vec4<f32>>;
 
     @group(0) @binding(10)
     var<storage,read_write> re5gs: array<u32>;
 
     @group(0) @binding(11)
     var<storage,read_write> rwjrfvb: array<u32>;
 
     @group(0) @binding(12)
     var<storage,read_write> rwjrrfhdf: Ijbsf;
      
     @group(0) @binding(14)
     var<storage, read_write> rwjrrysf: array<f32>; 
 
 
     
      @compute @workgroup_size(64)
      fn main(@builtin(global_invocation_id) id : vec3<u32>){
 
       let KjfeId = u32(id.x);
     
       if (KjfeId >= u32(rhfndg.hkshfb)) {
          return;
      }
      let rhff7sg = KjfeId*2;
      let KjfeIndexId = KjfeId*5;
      let rwj3wrf = u32(rhfndg.ehorqvhf)*9 + u32(rhfndg.hkshfb)*5;
 
      let rhf8gs = u32(rhfndg.yefpehfb);
      let rhfefb   = rhf8gs*2;  
      rfjsdnf[rhfefb + rhff7sg]        = vec4<f32>(0.0);
      rfjsdnf[rhfefb + rhff7sg + 1 ]   = vec4<f32>(0.0);
      rfbs[rwj3wrf + KjfeIndexId]         = 0; 
      rfbs[rwj3wrf + KjfeIndexId + 1 ]    = 0; 
      rfbs[rwj3wrf + KjfeIndexId + 2 ]    = 0; 
      rfbs[rwj3wrf + KjfeIndexId + 3 ]    = 0; 
      rfbs[rwj3wrf + KjfeIndexId + 4 ]    = 0; 
    } 