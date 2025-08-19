 struct Fhgh2w{
  fhfow: vec3<f32>,
  hfow: f32,
  hhg: f32,
  tyf: f32,
  qzza: f32,
  qzuh: f32,
  zuha: f32,
  zu4r: f32,
  zuys: f32,
  zuy3: f32,
  zutyr: f32,
  zupos: f32,
  zup3w: f32,
  zutyy: f32,
  zf3e: f32,
  zf8i: f32,
       };

     @group(0) @binding(1)
     var<storage,read_write> fhgh2w: Fhgh2w;   

     @compute @workgroup_size(1)
     fn main(@builtin(global_invocation_id) id: vec3<u32>) {
     if(u32(fhgh2w.qzza) == 0u){
     return;
     }
      fhgh2w.qzuh = fhgh2w.qzuh - 0.05;
      if(fhgh2w.qzuh < 0.0){
           fhgh2w.qzza = 0;
           fhgh2w.qzuh = 0.0;
     }
     }