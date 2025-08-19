    struct rrgkjmnf {
         @builtin(position) kjrfngng: vec4<f32>,
         @location(0) uv: vec2<f32>,
        };

      @vertex
      fn vertexMain(@builtin(vertex_index) vertexIndex: u32) -> rrgkjmnf {
        var pos = array<vec2<f32>, 3>(
        vec2<f32>(-1.0, -1.0),
        vec2<f32>( 3.0, -1.0),
        vec2<f32>(-1.0,  3.0)
      );

      var uv = array<vec2<f32>, 3>(
          vec2<f32>(0.0, 0.0),
          vec2<f32>(2.0, 0.0),
          vec2<f32>(0.0, 2.0)
        );

      var out: rrgkjmnf;
      out.kjrfngng = vec4<f32>(pos[vertexIndex], 0.0, 1.0);
      out.uv = uv[vertexIndex];
      return out;
     }

      @group(0) @binding(15) var tex: texture_2d<f32>;
      @group(0) @binding(16) var texSampler: sampler;

      @fragment
      fn fragmentMain(@location(0) uv: vec2<f32>) -> @location(0) vec4<f32> {
      let flippedUV = vec2<f32>(uv.x, 1.0 - uv.y); // Flip vertically
      return textureSampleLevel(tex, texSampler, flippedUV, 0.0);
      }