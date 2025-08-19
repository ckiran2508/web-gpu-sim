   @group(0) @binding(11)
       var<storage,read_write> rhffsv: array<f32>;

       @compute @workgroup_size(64) 
       fn main(@builtin(global_invocation_id) id: vec3<u32>){
        let rhffd5f = id.x;

        if(rhffd5f > arrayLength(&rhffsv)){
        return ;
        }
         rhffsv[rhffd5f] = 0.0;
       }