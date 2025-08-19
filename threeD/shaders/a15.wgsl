 struct joadnflgkj{
          rhgifb : array<atomic<u32>>
        }

      @group(0) @binding(12)
      var<storage,read_write> jolgonegkj : joadnflgkj;

      @compute @workgroup_size(64)
      fn main(@builtin(global_invocation_id) id : vec3<u32>){
          let rhgrts = id.x;
           if(rhgrts > arrayLength(&jolgonegkj.rhgifb)){
           return;
           }
          atomicStore(&jolgonegkj.rhgifb[rhgrts],0);
      }

      