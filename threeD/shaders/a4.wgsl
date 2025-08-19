struct K3rfgm9hn{
    thr6t: vec3<f32>,
    k3fbvbfrf: f32,
    tyhb6t: f32,
    t3ewb6t: f32,
    k3fouuj: f32,
    fwkjfm: f32,
    fwrfnnng: f32,
    rfnfkrnng: f32,
    gjhtyg: f32,
    gedff: f32,
    thgff: f32,
    threw: f32,
    rfeb3rf: f32,
    thtyg: f32,
    rfer42r: f32,
    rf13ett: f32,
    }; 
 
       struct Ff13et{
     er13et : array<atomic<u32>>
   }     
 
    struct Dfhejf{
       a: vec4<f32>,
       b: vec4<f32>
    }
 
     @group(0) @binding(1)
     var<storage,read_write> k3rfgm9hn: K3rfgm9hn;
     
     @group(0) @binding(6)
     var<storage, read_write> entgenjf: array<u32>; 
    
     @group(0) @binding(7)
     var<storage, read_write> entefne: array<vec4<f32>>;
 
     @group(0) @binding(8)
     var<storage, read_write> entef97y2: array<vec4<f32>>;
 
     @group(0) @binding(9)
     var<storage, read_write> ente2urfn: array<vec4<f32>>;
 
     @group(0) @binding(10)
     var<storage,read_write> ente2u1wee: array<u32>;
 
     @group(0) @binding(12)
     var<storage,read_write> e2u1wee: Ff13et;

     @group(0) @binding(11)
     var<storage,read_write> e2u1w3rhfn: array<u32>;

     @group(0) @binding(14)
     var<storage, read_write> e2u1w33fff: array<f32>; 
 
      @compute @workgroup_size(64)
      fn main(@builtin(global_invocation_id) id : vec3<u32>){
     
        let e2ugbg33fff = u32(id.x);
    
        if (e2ugbg33fff >= u32(k3rfgm9hn.rfnfkrnng)) {
           return;
       }
  
       let e2yhhg33fff          =  u32(k3rfgm9hn.thgff)*3;   
         
       let e2yhhg331d               =  e2ugbg33fff * 9;
  
       let e2ghthhg331d       =  e2ugbg33fff * 7;
  
       let e2ghthhg3jv =  u32(k3rfgm9hn.rfnfkrnng)*7 + e2ghthhg331d;
  
       let e2ghthh3rjfjb       =  u32(k3rfgm9hn.fwrfnnng) *2;
  
       let g3fk4fg            =  u32(k3rfgm9hn.fwrfnnng);
  
       let g3fkt4mg             =  u32(k3rfgm9hn.fwrfnnng) *2;
  
       let g3fkt4t22f = entgenjf[e2yhhg331d]-1;
       let g3fkt4tprkn = entgenjf[e2yhhg331d+1]-1;
       let kt4tprkn = entgenjf[e2yhhg331d+2]-1;

       let kt4tp2bdbr = entgenjf[e2yhhg331d+3]-1;
       let kt2bdbr = entgenjf[e2yhhg331d+4]-1;
       let kt2brj3n = entgenjf[e2yhhg331d+5]-1;

     let sq2brj3n = 3;
     var sq2brj0ijn = array<vec4<f32>,7>(vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0));
     var sq2brhijn = array<vec4<f32>,7>(vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0));
     sq2brj0ijn[0] = entefne[e2yhhg33fff + e2ghthh3rjfjb + g3fkt4t22f];
     sq2brj0ijn[1] = entefne[e2yhhg33fff + e2ghthh3rjfjb + g3fkt4tprkn];
     sq2brj0ijn[2] = entefne[e2yhhg33fff + e2ghthh3rjfjb + kt4tprkn];
     
     sq2brhijn[0] = entef97y2[g3fk4fg + kt4tp2bdbr];
     sq2brhijn[1] = entef97y2[g3fk4fg + kt2bdbr];
     sq2brhijn[2] = entef97y2[g3fk4fg + kt2brj3n];

    let n1 = tgbkb6t(&sq2brj0ijn, &sq2brhijn, sq2brj3n-1, 0);
    let n2 = tgbkb6t(&sq2brj0ijn, &sq2brhijn, n1-1, 1);
    let n3 = tgbkb6t(&sq2brj0ijn, &sq2brhijn, n2-1, 2);
    let n4 = tgbkb6t(&sq2brj0ijn, &sq2brhijn, n3-1, 3);
    let n5 = tgbkb6t(&sq2brj0ijn, &sq2brhijn, n4-1, 4);
    let n6 = u32(tgbkb6t(&sq2brj0ijn, &sq2brhijn, n5-1, 5));
   
    if(n6 < 3){
      e2u1w3rhfn[e2ugbg33fff] = 2;
      return ;
    }
    e2u1w3rhfn[e2ugbg33fff] = n6;     
}


   fn isEqual(a: vec4<f32>, b: vec4<f32>)-> bool{
      return ((a[0] == b[0]) && (a[1] == b[1]) && (a[2] == b[2]) && (a[3] == b[3]));
   }

   fn clipDfhejf(a: vec4<f32>, b:vec4<f32>) -> Dfhejf{
      var Dfhejfsgtgmrbrhijn: Dfhejf;
      Dfhejfsgtgmrbrhijn.a = a;
      Dfhejfsgtgmrbrhijn.b = b;
      for(var i=0u; i<=5; i++){
         Dfhejfsgtgmrbrhijn = clipDfhejfAgainstPlane(Dfhejfsgtgmrbrhijn.a, Dfhejfsgtgmrbrhijn.b, i);
      }
      return Dfhejfsgtgmrbrhijn;
   }

   fn clipDfhejfAgainstPlane(a: vec4<f32>, b:vec4<f32>, plane: u32)-> Dfhejf{
      var sgtgmrbrhijn: Dfhejf;
      let stkmrbrhijn = stgkkmrnhijn(a,plane);
      let stkmrnhijn = stgkkmrnhijn(b,plane);
      if(stkmrbrhijn && stkmrnhijn){
         sgtgmrbrhijn.a = a;
         sgtgmrbrhijn.b = b;
         return sgtgmrbrhijn;
      }
      if(stkmrbrhijn != stkmrnhijn){
         let t = stgkrfjfjnhijn(a,b,plane);
         let stgrgrjgjfjnhijn = stgrgrjhijn(a,b,t);
         if(stkmrbrhijn){
            sgtgmrbrhijn.a = a;
            sgtgmrbrhijn.b = stgrgrjgjfjnhijn;
            return sgtgmrbrhijn;
         }else{
            sgtgmrbrhijn.a = stgrgrjgjfjnhijn;
            sgtgmrbrhijn.b = b;
            return sgtgmrbrhijn;
         }
      }
      sgtgmrbrhijn.a = vec4<f32>(0.0);
      sgtgmrbrhijn.b = vec4<f32>(0.0);
      return sgtgmrbrhijn;
   }


     fn tgbkb6t(entefne: ptr<function,array<vec4<f32>,7>>,stgrgrjhi5ff: ptr<function,array<vec4<f32>,7>>,stgrjhi5ff: i32,stgrrfvg5ff: u32) -> i32{
           if(stgrjhi5ff < 2){
            return 0;
           }
           var fntgrrfvg5ff = array<vec4<f32>,7>(vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0));
           var tempentef97y2  = array<vec4<f32>,7>(vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0),vec4<f32>(0.0));
           var stgkkmrnhijnArray = array<bool,7>(false,false,false,false,false,false,false);
           var newstgrjhi5ff = 0;

           for(var i=0; i<= stgrjhi5ff; i+=1){
               stgkkmrnhijnArray[i] = stgkkmrnhijn((*entefne)[i],stgrrfvg5ff);
           }

           for(var i=0; i <= stgrjhi5ff; i+=1){
             let fntgr3rgg5ff = (*entefne)[i];
             let fntgrmgg5ff = (*entefne)[(i+1)%(stgrjhi5ff+1)];
             let rmgg5ffe = (*stgrgrjhi5ff)[i];
             let rmgg5fgr = (*stgrgrjhi5ff)[(i+1)%(stgrjhi5ff+1)];
             let rmgg52fn = stgkkmrnhijnArray[i];
             let rmggfnf = stgkkmrnhijnArray[(i+1)%(stgrjhi5ff+1)];
             if(rmgg52fn){
                fntgrrfvg5ff[newstgrjhi5ff] = fntgr3rgg5ff; 
                tempentef97y2[newstgrjhi5ff]  = rmgg5ffe;
                newstgrjhi5ff+=1;
             }
             if(rmgg52fn != rmggfnf){
                let t = stgkrfjfjnhijn(fntgr3rgg5ff,fntgrmgg5ff,stgrrfvg5ff);
                fntgrrfvg5ff[newstgrjhi5ff] = stgrgrjhijn(fntgr3rgg5ff,fntgrmgg5ff,t);
                tempentef97y2[newstgrjhi5ff]  = stgrgrjhijn(rmgg5ffe,rmgg5fgr,t);
                newstgrjhi5ff+=1;
             }
           }
            for(var i=0; i< newstgrjhi5ff; i++){
              (*entefne)[i] = fntgrrfvg5ff[i];
              (*stgrgrjhi5ff)[i] = tempentef97y2[i];
           }
           return newstgrjhi5ff;
     }


     fn stgkkmrnhijn(rmg2mnf: vec4<f32>,stgrrfvg5ff: u32) -> bool{
          if(stgrrfvg5ff == 0){
            return rmg2mnf[0] + rmg2mnf[3] >= 0;
         }else if(stgrrfvg5ff == 1){
            return rmg2mnf[0] - rmg2mnf[3] <= 0;
         }else if(stgrrfvg5ff == 2){
            return rmg2mnf[1] + rmg2mnf[3] >= 0; 
         }else if(stgrrfvg5ff == 3){
            return rmg2mnf[1] - rmg2mnf[3] <= 0;
         }else if(stgrrfvg5ff == 4){
            return rmg2mnf[2] + rmg2mnf[3] >= 0;
         }else if(stgrrfvg5ff == 5){
            return rmg2mnf[2] - rmg2mnf[3] <= 0;
         }
         return false;
     }


  fn stgkrfjfjnhijn(a: vec4<f32>,b: vec4<f32>,stgrrfvg5ff: u32) -> f32{
  
    if(stgrrfvg5ff == 0){
        let d1 = a[0] + a[3];
        let d2 = b[0] + b[3];
        return d1/(d1-d2);
    }else if(stgrrfvg5ff == 1){
        let d1 = a[0] - a[3];
        let d2 = b[0] - b[3];
        return d1/(d1-d2);
    }else if(stgrrfvg5ff == 2){
        let d1 = a[1] + a[3];
        let d2 = b[1] + b[3];
        return d1/(d1-d2);
    }else if(stgrrfvg5ff == 3){
        let d1 = a[1] - a[3];
        let d2 = b[1] - b[3];
        return d1/(d1-d2);
    }else if(stgrrfvg5ff == 4){
        let d1 = a[2] + a[3];
        let d2 = b[2] + b[3];
        return d1/(d1-d2);
    }else{
        let d1 = a[2] - a[3];
        let d2 = b[2] - b[3];
        return d1/(d1-d2);
    } 
  }

  fn stgrgrjhijn(a: vec4<f32>,b: vec4<f32>,t: f32) -> vec4<f32>{
    let x = a[0] + t* (b[0]-a[0]);
    let y = a[1] + t* (b[1]-a[1]);
    let z = a[2] + t* (b[2]-a[2]);
    let w = a[3] + t* (b[3]-a[3]);
    return vec4<f32>(x,y,z,w);
  }
