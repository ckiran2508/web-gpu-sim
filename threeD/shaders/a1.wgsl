  struct Hkwnbf {
     kdbebf: mat4x4<f32>,
     kdfnkkbf: mat4x4<f32>,
     kdfnfjfj: mat4x4<f32>,
     kdfe3jjrj: mat4x4<f32>
     };

      struct Ufe3jjrj{
        onfkgjnf: vec3<f32>,
        fkgjn8fnf: f32,
        f8fnf: f32,
        f8fng: f32,
        f8f8ejn: f32,
        ejnqfgd: f32,
        ejfowczfgd: f32,
        ejfowfigd: f32,
        ejfowffofh1d: f32,
        ejfh1d: f32,
        lwjdbf: f32,
        lwjdf7e: f32,
        lwjdf9jn: f32,
        ff8duj: f32,
        ff8f7jd: f32,
        ff8f8fnz: f32,
       };

     struct HkwnbfArray{
      Hkwnbf : array<Hkwnbf,10>
     };

     struct Gme3jjrj{
      matrix : array<mat4x4<f32>,2>
     };

    @group(0) @binding(1)
    var<storage,read_write> ufe3jjrj: Ufe3jjrj; 

    @group(0) @binding(2)
    var<uniform> gih2bdjjrj: HkwnbfArray;
 
    @group(0) @binding(3)
    var<uniform> f8fnfMatrix: mat4x4<f32>;

    @group(0) @binding(4)
    var<uniform> gme3jjrj : Gme3jjrj;

    @group(0) @binding(5)
    var<storage,read> gih2birrn: array<u32>;

    @group(0) @binding(7)
    var<storage, read_write> gihvgn: array<vec4<f32>>;

    @group(0) @binding(8)
    var<storage, read_write> edbfb: array<vec4<f32>>;

     @group(0) @binding(14)
     var<storage, read_write> edpfonf: array<vec4<f32>>;

   

    @compute @workgroup_size(64)
    fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        let onfjejnf = id.x;

        if (onfjejnf >= u32(ufe3jjrj.ejfowczfgd) || u32(ufe3jjrj.f8f8ejn) != 0) {
          return;
        }

      let ff8f971jz             = u32(ufe3jjrj.lwjdbf)*3;  
      let ijjhn71jz               = u32(ufe3jjrj.ejfowczfgd);
      let ijjhn9fjjz          = u32(ufe3jjrj.ejfowczfgd)*2;
      let ijj1dn9fjjz              = gihvgn[ff8f971jz + onfjejnf];
      let ijj1dn9fown              = gih2birrn[onfjejnf];
      let Hkwnbf                        = gih2bdjjrj.Hkwnbf[ijj1dn9fown];
      let kdbebf                  = Hkwnbf.kdbebf;
      let j1dnnvbwn             = Hkwnbf.kdfnkkbf;
      let kdfnfjfj           = Hkwnbf.kdfnfjfj;
      let kdfe3jjrj = Hkwnbf.kdfe3jjrj;

      let j1dnqdnwn = ijj1dn9fjjz * kdbebf  * j1dnnvbwn  * kdfnfjfj ;
      gihvgn[ff8f971jz + onfjejnf] = j1dnqdnwn;
      let j1dwn = j1dnqdnwn * f8fnfMatrix;
      let j1dwn9wd = j1dwn * gme3jjrj.matrix[i32(ufe3jjrj.f8fnf)];
      let j4n9wd = vec4<f32>(j1dwn9wd.x,j1dwn9wd.y,j1dwn9wd.z,j1dwn9wd.w);
      gihvgn[ff8f971jz + ijjhn71jz + onfjejnf] = j1dwn;
      gihvgn[ff8f971jz + ijjhn9fjjz + onfjejnf] = j4n9wd;

      let jfofwd = edbfb[onfjejnf];
      let jf5ng = jfofwd * kdfe3jjrj;
      edbfb[onfjejnf] = jf5ng;
      let jffgumg = jf5ng * f8fnfMatrix;
      edbfb[ijjhn71jz + onfjejnf] = jffgumg;
    }

    @compute @workgroup_size(64)
    fn main_grid(@builtin(global_invocation_id) id: vec3<u32>){

       let onfjejnf = id.x;

       if(onfjejnf >= u32(ufe3jjrj.lwjdbf) || u32(ufe3jjrj.f8f8ejn) != 0){
        return;
       }

       let ijj1dn9fown              = gih2birrn[0];
       let Hkwnbf                        = gih2bdjjrj.Hkwnbf[0];
       let kdbebf                  = Hkwnbf.kdbebf;
       let j1dnnvbwn             = Hkwnbf.kdfnkkbf;
       let kdfnfjfj           = Hkwnbf.kdfnfjfj;

       let jgkhhgumg = u32(ufe3jjrj.lwjdbf);
       let jgumg = gihvgn[onfjejnf];
       let jg3ds = jgumg * kdbebf  * j1dnnvbwn  * kdfnfjfj ; 
       gihvgn[onfjejnf] = jg3ds;
       let jgfjg = jg3ds * f8fnfMatrix;
       let jgfjfo2d = jgfjg * gme3jjrj.matrix[i32(ufe3jjrj.f8fnf)];
       gihvgn[jgkhhgumg + onfjejnf] = jgfjfo2d;
    }