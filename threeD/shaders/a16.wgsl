   @group(0) @binding(13)
        var rhffiasf: texture_storage_2d<rgba8unorm, write>;

        @compute @workgroup_size(16, 16)
        fn main(@builtin(global_invocation_id) id: vec3<u32>) {
        let dims = textureDimensions(rhffiasf);
        if (id.x >= dims.x || id.y >= dims.y) {
            return;
        }
        textureStore(rhffiasf, vec2<i32>(id.xy), vec4f(0.1));
       }