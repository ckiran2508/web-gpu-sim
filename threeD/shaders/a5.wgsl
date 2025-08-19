struct Sliuedvd{
   sliurufg: vec3<f32>,
   sliuef: f32,
   slqgfs: f32,
   sltrys: f32,
   slvnbvd: f32,
   slvhfgfv: f32,
   dfbggn: f32,
   dfrsgd: f32,
   dbncbdvf: f32,
   dbnnfb: f32,
   bbffvc: f32,
   bbbjfbf: f32,
   bbfnfg: f32,
   bjwjfbf: f32,
   bjggbtt: f32,
   brhevfv: f32,
   bbgb: f32,
   fbe6ee: f32,
   fbe6r: f32,
   }; 

      struct fbmnvc{
    fefgbvv : array<atomic<u32>>
  }     

   struct Bgfhe{
      a: vec4<f32>,
      b: vec4<f32>
   }

    @group(0) @binding(1)
    var<storage,read_write> sliuedvd: Sliuedvd;
    
    @group(0) @binding(6)
    var<storage, read_write> xvshfg: array<u32>; 
   
    @group(0) @binding(7)
    var<storage, read_write> xvsutd: array<vec4<f32>>;

    @group(0) @binding(8)
    var<storage, read_write> xwszav: array<vec4<f32>>;

    @group(0) @binding(9)
    var<storage, read_write> xwspirhe: array<vec4<f32>>;

    @group(0) @binding(10)
    var<storage,read_write> xwsp4ggd: array<u32>;

    @group(0) @binding(11)
    var<storage,read_write> xwsppehgbr: array<u32>;

    @group(0) @binding(12)
    var<storage,read_write> xwspjb: fbmnvc;
     
    @group(0) @binding(14)
    var<storage, read_write> xwrhwvqx: array<f32>; 


    
     @compute @workgroup_size(64)
     fn main(@builtin(global_invocation_id) id : vec3<u32>){

      let xwrhubbe = u32(id.x);
    
      if (xwrhubbe >= u32(sliuedvd.dfrsgd)) {
         return;
     }


     let xwrghbd          =  u32(sliuedvd.bbffvc)*3;   

     let gjbfbs  =  u32(sliuedvd.bbffvc);

     let gjvqs     =  u32(sliuedvd.bbbjfbf)*5; 
       
     let gjwysn               =  xwrhubbe * 9;

     let gjwvwge       =  xwrhubbe * 7;

     let gjwofgn =  u32(sliuedvd.dfrsgd)*7 + gjwvwge;

     let gqwwf4t       =  u32(sliuedvd.dfbggn) *2;

     let gqw3e            =  u32(sliuedvd.dfbggn);

     let nngbne             =  u32(sliuedvd.dfbggn) *2;

     let nnvbvwh = xvshfg[gjwysn]-1;
     let nnvb3d = xvshfg[gjwysn+1]-1;
     let nn3rnfn = xvshfg[gjwysn+2]-1;

     let nnfbfb3t = xvshfg[gjwysn+3]-1;
     let nnfvneea = xvshfg[gjwysn+4]-1;
     let nnfvlkjv = xvshfg[gjwysn+5]-1;

     let nnfvqehfbf = xvsutd[xwrghbd + gqw3e + nnvbvwh];
     let nnfvqes = xvsutd[xwrghbd + gqw3e + nnvb3d];
     let nnfv5ggd = xvsutd[xwrghbd + gqw3e + nn3rnfn];

     let fv5ggd = nnfvqes - nnfvqehfbf;
     let fv5ghrr = nnfv5ggd - nnfvqehfbf;
     let fv5ghgjtn = normalize(cross(fv5ggd.xyz,fv5ghrr.xyz));
     xwszav[nngbne+xwrhubbe] =  vec4<f32>(fv5ghgjtn[0],fv5ghgjtn[1],fv5ghgjtn[2],0); 

     let fv5ghggrrn = 3;
     var fvrngbfn = array<vec4<f32>,7>(vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0));
     var fvnbgrrx = array<vec4<f32>,7>(vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0));
     fvrngbfn[0] = xvsutd[xwrghbd + gqwwf4t + nnvbvwh];
     fvrngbfn[1] = xvsutd[xwrghbd + gqwwf4t + nnvb3d];
     fvrngbfn[2] = xvsutd[xwrghbd + gqwwf4t + nn3rnfn];
     
     fvnbgrrx[0] = xwszav[gqw3e + nnfbfb3t];
     fvnbgrrx[1] = xwszav[gqw3e + nnfvneea];
     fvnbgrrx[2] = xwszav[gqw3e + nnfvlkjv];

    let n1 = fvnbefe3dg(&fvrngbfn, &fvnbgrrx, fv5ghggrrn-1, 0);
    let n2 = fvnbefe3dg(&fvrngbfn, &fvnbgrrx, n1-1, 1);
    let n3 = fvnbefe3dg(&fvrngbfn, &fvnbgrrx, n2-1, 2);
    let n4 = fvnbefe3dg(&fvrngbfn, &fvnbgrrx, n3-1, 3);
    let n5 = fvnbefe3dg(&fvrngbfn, &fvnbgrrx, n4-1, 4);
    let n6 = u32(fvnbefe3dg(&fvrngbfn, &fvnbgrrx, n5-1, 5));
   
    if(n6 < 3){
      return ;
    }

    var fvnbeerfe: u32;

    let fvnbefetjt : bool = (u32(sliuedvd.fbe6r) & 1u) == 1u;

    if(fvnbefetjt){
      fvnbeerfe = u32(sliuedvd.dfrsgd);
    }else{
      fvnbeerfe = 0;
    }


    var fvnbeegwgd : u32;
    var fvnbeewed: u32 = xwsppehgbr[fvnbeerfe + u32(sliuedvd.dfrsgd) - 1];

    if(xwrhubbe == 0){
      fvnbeegwgd = 0;
    }else{
      fvnbeegwgd = xwsppehgbr[fvnbeerfe + xwrhubbe - 1]; 
      fvnbeewed = fvnbeewed + fvnbeegwgd;
    }

    for(var i=0u; i < n6 ; i++){
       xwspirhe[gjbfbs + fvnbeegwgd + i]       = fvrngbfn[i];
       xwspirhe[gjbfbs + fvnbeewed + i] = fvnbgrrx[i];
    }

    var fvnrjebfz : u32;
    if(xwrhubbe == 0){
      fvnrjebfz = 0;
    } else{
      fvnrjebfz = fvnbeegwgd - 2*(xwrhubbe);
    }

    
    for(var i=1u; i < n6 - 1; i++){
      let xwsp4ggdbfzrgng = gjvqs + fvnrjebfz*10;
      xwsp4ggd[xwsp4ggdbfzrgng] = fvnbeegwgd+1;
      xwsp4ggd[xwsp4ggdbfzrgng + 1] = fvnbeegwgd+1+i;
      xwsp4ggd[xwsp4ggdbfzrgng + 2] = fvnbeegwgd+2+i;
      xwsp4ggd[xwsp4ggdbfzrgng + 3] = fvnbeegwgd+1;
      xwsp4ggd[xwsp4ggdbfzrgng + 4] = fvnbeegwgd+1+i;
      xwsp4ggd[xwsp4ggdbfzrgng + 5] = fvnbeegwgd+2+i;
      xwsp4ggd[xwsp4ggdbfzrgng + 6] = xvshfg[gjwysn+6];
      xwsp4ggd[xwsp4ggdbfzrgng + 7] = xvshfg[gjwysn+7];
      xwsp4ggd[xwsp4ggdbfzrgng + 8] = xvshfg[gjwysn+8];
      xwsp4ggd[xwsp4ggdbfzrgng + 9] = xwrhubbe;
      fvnrjebfz = fvnrjebfz + 1;
    }
}


   @compute @workgroup_size(64)
   fn main_grid(@builtin(global_invocation_id) id: vec3<u32>){
      let bfzrgng = id.x * 5;

      let bfpjeb = u32(sliuedvd.bbffvc);
      let clippedGridVerticesOffset   = bfpjeb*2;

      if(id.x >= u32(sliuedvd.bbbjfbf)){
        return;
      }

      let bfhjhrgn = u32(sliuedvd.dfrsgd)*9;
      let bfhjrhrbt = id.x * 2; 
      let clippedbfhjhrgn = u32(sliuedvd.dfrsgd)*9 + u32(sliuedvd.bbbjfbf)*5;

      let nnvbvwh = xvshfg[bfhjhrgn + bfzrgng ]   -1;
      let nnvb3d = xvshfg[bfhjhrgn + bfzrgng +1] -1;
      let r       = xvshfg[bfhjhrgn + bfzrgng +2]; 
      let g       = xvshfg[bfhjhrgn + bfzrgng +3]; 
      let b       = xvshfg[bfhjhrgn + bfzrgng +4]; 

      let bfhwrjff = xvsutd[bfpjeb + nnvbvwh];
      let bgmng = xvsutd[bfpjeb + nnvb3d];
      var brhbrn = clipBgfhe(bfhwrjff, bgmng);
      if(!(isEqual(brhbrn.a,brhbrn.b))){
          xwspirhe[  bfhjrhrbt]   = brhbrn.a;
          xwspirhe[  bfhjrhrbt+1] = brhbrn.b;
          let currentbjwjfbf = atomicAdd(&xwspjb.fefgbvv[1],1) * 5;
          xwsp4ggd[  currentbjwjfbf]    = bfhjrhrbt + 1;
          xwsp4ggd[  currentbjwjfbf +1] = bfhjrhrbt + 2;
          xwsp4ggd[  currentbjwjfbf +2] = r;
          xwsp4ggd[  currentbjwjfbf +3] = g;
          xwsp4ggd[  currentbjwjfbf +4] = b;
      }
   }

   fn isEqual(a: vec4<f32>, b: vec4<f32>)-> bool{
      return ((a[0] == b[0]) && (a[1] == b[1]) && (a[2] == b[2]) && (a[3] == b[3]));
   }

   fn clipBgfhe(a: vec4<f32>, b:vec4<f32>) -> Bgfhe{
      var Bgfhebrhiw: Bgfhe;
      Bgfhebrhiw.a = a;
      Bgfhebrhiw.b = b;
      for(var i=0u; i<=5; i++){
         Bgfhebrhiw = brhetgnfnww(Bgfhebrhiw.a, Bgfhebrhiw.b, i);
      }
      return Bgfhebrhiw;
   }

   fn brhetgnfnww(a: vec4<f32>, b:vec4<f32>, plane: u32)-> Bgfhe{
      var brhiw: Bgfhe;
      let brhiwgldk = brhr3rfghh(a,plane);
      let brhitut = brhr3rfghh(b,plane);
      if(brhiwgldk && brhitut){
         brhiw.a = a;
         brhiw.b = b;
         return brhiw;
      }
      if(brhiwgldk != brhitut){
         let t = brhi5t3r(a,b,plane);
         let brh3ngj3h = brh3rgb4d(a,b,t);
         if(brhiwgldk){
            brhiw.a = a;
            brhiw.b = brh3ngj3h;
            return brhiw;
         }else{
            brhiw.a = brh3ngj3h;
            brhiw.b = b;
            return brhiw;
         }
      }
      brhiw.a = vec4<f32>(0.0);
      brhiw.b = vec4<f32>(0.0);
      return brhiw;
   }


     fn fvnbefe3dg(xvsutd: ptr<function,array<vec4<f32>,7>>,kbevbrbbg: ptr<function,array<vec4<f32>,7>>,endbfzrgng: i32,k3rr09hn: u32) -> i32{
           if(endbfzrgng < 2){
            return 0;
           }
           var brh3r2rth = array<vec4<f32>,7>(vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0));
           var tempxwszav  = array<vec4<f32>,7>(vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0));
           var brh3rh3ktk = array<bool,7>(false,false,false,false,false,false,false);
           var newEndbfzrgng = 0;

           for(var i=0; i<= endbfzrgng; i+=1){
               brh3rh3ktk[i] = brhr3rfghh((*xvsutd)[i],k3rr09hn);
           }

           for(var i=0; i <= endbfzrgng; i+=1){
             let kbevb = (*xvsutd)[i];
             let kbevb4jrh = (*xvsutd)[(i+1)%(endbfzrgng+1)];
             let kbevbqksnd = (*kbevbrbbg)[i];
             let kbevb4jrhNormal = (*kbevbrbbg)[(i+1)%(endbfzrgng+1)];
             let kbevbIsInside = brh3rh3ktk[i];
             let kbevb4jrhIsInside = brh3rh3ktk[(i+1)%(endbfzrgng+1)];
             if(kbevbIsInside){
                brh3r2rth[newEndbfzrgng] = kbevb; 
                tempxwszav[newEndbfzrgng]  = kbevbqksnd;
                newEndbfzrgng+=1;
             }
             if(kbevbIsInside != kbevb4jrhIsInside){
                let t = brhi5t3r(kbevb,kbevb4jrh,k3rr09hn);
                brh3r2rth[newEndbfzrgng] = brh3rgb4d(kbevb,kbevb4jrh,t);
                tempxwszav[newEndbfzrgng]  = brh3rgb4d(kbevbqksnd,kbevb4jrhNormal,t);
                newEndbfzrgng+=1;
             }
           }
            for(var i=0; i< newEndbfzrgng; i++){
              (*xvsutd)[i] = brh3r2rth[i];
              (*kbevbrbbg)[i] = tempxwszav[i];
           }
           return newEndbfzrgng;
     }


     fn brhr3rfghh(k3rrbbg: vec4<f32>,k3rr09hn: u32) -> bool{
          if(k3rr09hn == 0){
            return k3rrbbg[0] + k3rrbbg[3] >= 0;
         }else if(k3rr09hn == 1){
            return k3rrbbg[0] - k3rrbbg[3] <= 0;
         }else if(k3rr09hn == 2){
            return k3rrbbg[1] + k3rrbbg[3] >= 0; 
         }else if(k3rr09hn == 3){
            return k3rrbbg[1] - k3rrbbg[3] <= 0;
         }else if(k3rr09hn == 4){
            return k3rrbbg[2] + k3rrbbg[3] >= 0;
         }else if(k3rr09hn == 5){
            return k3rrbbg[2] - k3rrbbg[3] <= 0;
         }
         return false;
     }


  fn brhi5t3r(a: vec4<f32>,b: vec4<f32>,k3rr09hn: u32) -> f32{
  
    if(k3rr09hn == 0){
        let d1 = a[0] + a[3];
        let d2 = b[0] + b[3];
        return d1/(d1-d2);
    }else if(k3rr09hn == 1){
        let d1 = a[0] - a[3];
        let d2 = b[0] - b[3];
        return d1/(d1-d2);
    }else if(k3rr09hn == 2){
        let d1 = a[1] + a[3];
        let d2 = b[1] + b[3];
        return d1/(d1-d2);
    }else if(k3rr09hn == 3){
        let d1 = a[1] - a[3];
        let d2 = b[1] - b[3];
        return d1/(d1-d2);
    }else if(k3rr09hn == 4){
        let d1 = a[2] + a[3];
        let d2 = b[2] + b[3];
        return d1/(d1-d2);
    }else{
        let d1 = a[2] - a[3];
        let d2 = b[2] - b[3];
        return d1/(d1-d2);
    } 
  }

  fn brh3rgb4d(a: vec4<f32>,b: vec4<f32>,t: f32) -> vec4<f32>{
    let x = a[0] + t* (b[0]-a[0]);
    let y = a[1] + t* (b[1]-a[1]);
    let z = a[2] + t* (b[2]-a[2]);
    let w = a[3] + t* (b[3]-a[3]);
    return vec4<f32>(x,y,z,w);
  }
