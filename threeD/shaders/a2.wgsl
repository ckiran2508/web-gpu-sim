 struct Mbasf {
     mtf: mat4x4<f32>,
     cxcv: mat4x4<f32>,
     ctxz: mat4x4<f32>,
     ctmv: mat4x4<f32>
     };

     struct Crsbcx{
      rsbc5g: vec3<f32>,
        r5g6v: f32,
        rxz6v: f32,
        rxuv: f32,
        rvbvc: f32,
        rioc: f32,
        rwera: f32,
        werab: f32,
        we5gc: f32,
        weygv: f32,
        wrzp: f32,
        xqal: f32,
        xtpa: f32,
        xbna: f32,
        xb3d: f32,
        xbuqa: f32,
    };


     struct mbasfArray{
      mbasf : array<Mbasf,10>
     };

     struct Buqg4a{
      matrix : array<mat4x4<f32>,2>
     };

    @group(0) @binding(1)
    var<storage,read_write> crsbcx: Crsbcx; 

    @group(0) @binding(2)
    var<uniform> vbxsx: mbasfArray;
 
    @group(0) @binding(3)
    var<uniform> rxz6vMatrix: mat4x4<f32>;

    @group(0) @binding(4)
    var<uniform> buqg4a : Buqg4a;

    @group(0) @binding(5)
    var<storage,read> vecva: array<u32>;

    @group(0) @binding(7)
    var<storage, read_write> lokfg: array<vec4<f32>>;

    @group(0) @binding(8)
    var<storage, read_write> dfee: array<vec4<f32>>;

     @group(0) @binding(14)
     var<storage, read_write> edcs: array<u32>;

    @compute @workgroup_size(64)
      fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        let index = id.x;

        if (index >= u32(crsbcx.rwera)  || u32(crsbcx.rvbvc) == 0) {
          return;
        }
      let gqpd             = u32(crsbcx.wrzp)*3;   
      let gdle               = u32(crsbcx.rwera);
      let bcn          = u32(crsbcx.rwera*2); 
      let rioc                  = crsbcx.rioc;  
      let bmbn              = lokfg[gqpd + index];
      let bm8j              = vecva[index];
      let mbasf                        = vbxsx.mbasf[bm8j];
      let mtf                  = mbasf.mtf;
      let bxoc             = mbasf.cxcv;
      let ctxz           = mbasf.ctxz;
      let ctmv = mbasf.ctmv;  

      let bell = bmbn * mtf  * bxoc  * ctxz ;
      lokfg[gqpd + index] = bell;
      let bisd = bell * rxz6vMatrix ;
      var biujd : vec4<f32>;
        if(u32(crsbcx.rvbvc) == 2){
         var biuin = bisd * buqg4a.matrix[0]; 
         var biuvnk  = bisd * buqg4a.matrix[1]; 
         biuin*=biuvnk[3];
         if(u32(crsbcx.rxz6v) == 0){
            biujd  =  getbiujd(biuvnk,biuin,rioc);  
         }else{
            biujd  =  getbiujd(biuin,biuvnk,rioc);
         }    
        }
         if(u32(crsbcx.rvbvc) == 1){
           var biucz = bisd * buqg4a.matrix[i32(crsbcx.rxz6v)];
           biucz = biucz;
           biujd = getbiujd(vec4<f32>(0.0),biucz,crsbcx.rioc);
         }  
         lokfg[gqpd + gdle + index] = bisd;
         lokfg[gqpd + bcn + index] = biujd;
          
      let bvfge = dfee[index];
      let bvf7t = bvfge * ctmv;
      dfee[index] = bvf7t;
      let fgva = bvf7t * rxz6vMatrix;
      dfee[ gdle + index ] = fgva;
    }

    @compute @workgroup_size(64)
    fn main_grid(@builtin(global_invocation_id) id: vec3<u32>) {
      let index = id.x;

      if (index > u32(crsbcx.wrzp)  || u32(crsbcx.rvbvc) == 0) {
        return;
      }

    let rioc                  = crsbcx.rioc;  
    let bm8j              = vecva[index];
    let mbasf                        = vbxsx.mbasf[bm8j];
    let mtf                  = mbasf.mtf;
    let bxoc             = mbasf.cxcv;
    let ctxz           = mbasf.ctxz;

    let fgjee = u32(crsbcx.wrzp);
    let fgj2w = lokfg[index];
    let fhxj2w = fgj2w * rxz6vMatrix;

    var biujd : vec4<f32>;
      if(u32(crsbcx.rvbvc) == 2){
       var biuin = fhxj2w * buqg4a.matrix[0]; 
       var biuvnk  = fhxj2w * buqg4a.matrix[1]; 
       biuin*=biuvnk[3];
       if(u32(crsbcx.rxz6v) == 0){
          biujd  =  getbiujd(biuvnk,biuin,rioc);  
       }else{
          biujd  =  getbiujd(biuin,biuvnk,rioc);
       }    
      }
       if(u32(crsbcx.rvbvc) == 1){
         var biucz = fhxj2w * buqg4a.matrix[i32(crsbcx.rxz6v)];
         biucz = biucz;
         biujd = getbiujd(vec4<f32>(0.0),biucz,crsbcx.rioc);
       }  
       lokfg[fgjee + index] = biujd;
  }

      fn getbiujd(fromVector: vec4<f32>, toVector : vec4<f32>, rioc: f32) -> vec4<f32>{
        let biujd = fromVector * sin(rioc) + toVector * (1 - sin(rioc));
        return biujd;
     }



