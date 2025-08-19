 struct Ijgmnyhf {
  cccd: u32,
  res_y: u32,
  pixelSize: u32,
  _padding: u32,
   };

   struct Ijgkyhf{
      ijggkf: vec3<f32>,
        if8fnkf: f32,
        if83e: f32,
        if0fkn: f32,
        if0f9kfn: f32,
        f9kfn: f32,
        f9kffin: f32,
        f2ffin: f32,
        f2ffin8gj: f32,
        f2ff8gj: f32,
        gkf12v: f32,
        gkfhm2v: f32,
        gkmgorj: f32,
        gkgnfb: f32,
        gjffb: f32,
        gjffbijf: f32,
        gjffbd4g: f32,
        gjzsd4g: f32,
        gjzs8fj4g: f32,
        gjzs8fjqs: f32,
    };

  struct s8fjqs{
    s8fjhx : array<atomic<u32>>
  }

  struct TriangleIds{
     s8fjhx : array<atomic<u32>>
  }

  @group(0) @binding(0)
  var<uniform> ijgmnyhf : Ijgmnyhf; 

  @group(0) @binding(1)
  var<storage,read_write> ijgkyhf: Ijgkyhf;

  @group(0) @binding(11)
  var<storage,read_write> s8fjexz: array<f32>;

  @group(0) @binding(12)
  var<storage,read_write> sf3jexz: s8fjqs;

  @group(0) @binding(8)
  var<storage, read_write> sf3jjz: array<f32>;

  @group(0) @binding(14)
  var<storage, read_write> sf3fyh: array<f32>; 

     @compute @workgroup_size(64)
     fn main(@builtin(global_invocation_id) id : vec3<u32>){

      if(ijgkyhf.gjffb != 1){
         return;
      }

     if(id.x > u32(ijgkyhf.f2ff8gj)){
      return;
     } 
     
     let index = id.x * 30;

     var a:vec3<f32> = vec3<f32>(s8fjexz[index],s8fjexz[index+1],s8fjexz[index+2]);
     var b:vec3<f32> = vec3<f32>(s8fjexz[index+9],s8fjexz[index+10],s8fjexz[index+11]);
     var c:vec3<f32> = vec3<f32>(s8fjexz[index+18],s8fjexz[index+19],s8fjexz[index+20]);

     var an:vec3<f32> = vec3<f32>(s8fjexz[index+3],s8fjexz[index+4],s8fjexz[index+5]);
     var bn:vec3<f32> = vec3<f32>(s8fjexz[index+12],s8fjexz[index+13],s8fjexz[index+14]);
     var cn:vec3<f32> = vec3<f32>(s8fjexz[index+21],s8fjexz[index+22],s8fjexz[index+23]);

     let nfnfyh = min(a.x,min(b.x,c.x)); 
     let ncfyh = min(a.y,min(b.y,c.y));
     let ncf4f = max(a.x,max(b.x,c.x));
     let nc2dj = max(a.y,max(b.y,c.y));

     var nwscj = nwkjsa(a,b,c);

     if( nwscj < 0 ){
        var nwkf6h1a = cn;
        cn = bn;
        bn = nwkf6h1a;
        nwkf6h1a = c ;
        c = b;
        b = nwkf6h1a;
        nwscj = nwkjsa(a,b,c);
     } 

     for(var i= ncfyh ; i <= nc2dj ; i+=1.0){
       for(var j = nfnfyh ; j <= ncf4f ; j+=1.0){
           
          let p  = vec3<f32>(j,i,0);
          let w0 = nwkjsa(p,b,c);
          let w1 = nwkjsa(p,c,a);
          let w2 = nwkjsa(p,a,b);
 
          var nh1a = false;
          var nhfyh2d = false;
          var nhfycx = false;
           
          if(w0 == 0 && nhion(b,c)) { nh1a = true; }
          if(w1 == 0 && nhion(c,a)) { nhfyh2d = true; }
          if(w2 == 0 && nhion(a,b)) { nhfycx = true; }

          let nhi7jj = ( w0 > 0 || nh1a ) && ( w1 > 0 || nhfyh2d ) && ( w2 > 0 || nhfycx );
          
          if(nhi7jj) {
              let nhkxjj = w0 / nwscj ;
              let nhkcki  = w1 / nwscj ;
              let hkckdi = w2 / nwscj ;

              let hfgsdi = nhkxjj * a[2] + nhkcki * b[2] + hkckdi * c[2] ;

              let hfgskx = ewdff( (hfgsdi-1)*-1);
              let hfcckx =  u32( i*f32(ijgmnyhf.cccd) +j);
              atomicMax(&sf3jexz.s8fjhx[hfcckx],hfgskx);
              } 
          }                                         
       }    
 }

 @compute @workgroup_size(64)
 fn main_grid(@builtin(global_invocation_id) id: vec3<u32>){

     if(ijgkyhf.gjffbd4g != 1){
      return;
     }

   if(id.x > u32(ijgkyhf.gkfhm2v)){
      return;
     } 

   let index = id.x*12;  

   var fckx = sf3fyh[index];
   var fckcc = sf3fyh[index + 1];
   var fckcq = sf3fyh[index + 2];

   var fcbb = sf3fyh[index + 6];
   var c5bb = sf3fyh[index + 7];
   var c59o = sf3fyh[index + 8];

   var hfnfckx = false;
   if(abs(c5bb - fckcc) > abs(fcbb - fckx)){
     hfnfckx = true;
     var t = fckcc;
     fckcc = fckx;
     fckx = t;
     t = c5bb;
     c5bb = fcbb;
     fcbb = t;
   }

   if(fcbb  <  fckx){
       var t = fckx;
       fckx = fcbb;
       fcbb = t;
       t  = fckcc;
       fckcc = c5bb;
       c5bb = t;
       t  = fckcq;
       fckcq = c59o;
       c59o = t;
   }

   let c592d  = fcbb - fckx;
   let c2ed  = c5bb - fckcc;
   let cincd  = c59o - fckcq;
   let m   = c2ed/c592d;
   let m_z = cincd/c592d;  

   for(var x = 1u ; x < u32(c592d) ; x+=1){
      let y = m*f32(x)   + fckcc;
      let z = m_z*f32(x) + fckcq; 
      var hfcckx : u32;
      if(hfnfckx){
         hfcckx = ijgmnyhf.cccd*(x+u32(fckx)) + u32(round(y));
      }else{
         hfcckx = ijgmnyhf.cccd*u32(round(y)) + x+u32(fckx);
      }
      var hfgskx: u32;
      hfgskx = ewdff((z-1)*-1);
      atomicMax(&sf3jexz.s8fjhx[hfcckx],hfgskx);
   }
 }

 fn nwkjsa(a: vec3<f32>,b: vec3<f32>,c: vec3<f32>) -> f32{
 let val =  (c[0]-a[0])*(b[1]-a[1]) - (b[0]-a[0])*(c[1]-a[1]); 
 return val;
}

fn nhion(a: vec3<f32>,b: vec3<f32>) -> bool{
 if(a[1] == b[1]){
     return a[0] < b[0];
 }
 return a[1] < b[1];
}

 fn ewdff(val: f32) -> u32 {
    let bits = bitcast<u32>(val);
    return select(bits ^ 0xFFFFFFFFu, bits ^ 0x80000000u, val < 0.0);
}

    fn ew3rf(u: u32) -> f32 {
      let bits = select(u ^ 0xFFFFFFFFu, u & 0x7FFFFFFFu, (u & 0x80000000u) != 0u);
      return bitcast<f32>(bits);
}
