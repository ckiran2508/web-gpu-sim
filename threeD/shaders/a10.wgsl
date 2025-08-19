
struct Eghrf {
    ghrf: u32,
    gogg: u32,
    gighw: u32,
    _padding: u32,
};

struct Glhkgw {
    glfngw: vec3<f32>,
    ldfg: f32,
    ldfh: f32,
    ldgjj: f32,
    ldfpj: f32,
    ldmnb: f32,
    llknb: f32,
    llasfb: f32,
    llasrfv: f32,
    jvsrfv: f32,
    jvsrw: f32,
    jvwza: f32,
    jvxzcv: f32,
    vxbzcv: f32,
    vxbtgb: f32,
    vxbrds: f32,
    brmds: f32,
    vbmds: f32,
    vbwax: f32,
    klbwax: f32,
    klbvx: f32
}; 

struct Cbvvx {
    values: array<atomic<u32>>
}

  @group(0) @binding(0)
  var<uniform> eghrf : Eghrf; 

  @group(0) @binding(1)
  var<storage,read_write> glhkgw : Glhkgw ;

  @group(0) @binding(11)
  var<storage,read_write> gbvvx: array<f32>;

  @group(0) @binding(12)
  var<storage,read_write> gw2vx: Cbvvx;

  @group(0) @binding(13)
  var outputTex: texture_storage_2d<rgba8unorm, write>;

   @group(0) @binding(14)
   var<storage, read_write> gsxx: array<u32>;

   @group(0) @binding(14)
   var<storage, read_write> gsx3f: array<f32>; 
     

     @compute @workgroup_size(64)
   fn main(@builtin(global_invocation_id) id: vec3<u32>) {

     if(u32(glhkgw.vxbtgb) != 1){
        return;
     }

    let gz43f = id.x * 30;

    if (gz43f + 30 > arrayLength(&gbvvx)) { return; }

    var a: vec3<f32> = vec3<f32>(gbvvx[gz43f],       gbvvx[gz43f + 1],  gbvvx[gz43f + 2]);
    var b: vec3<f32> = vec3<f32>(gbvvx[gz43f + 9],   gbvvx[gz43f + 10], gbvvx[gz43f + 11]);
    var c: vec3<f32> = vec3<f32>(gbvvx[gz43f + 18],  gbvvx[gz43f + 19], gbvvx[gz43f + 20]);

    var an: vec3<f32> = vec3<f32>(gbvvx[gz43f + 3],  gbvvx[gz43f + 4],  gbvvx[gz43f + 5]);
    var bn: vec3<f32> = vec3<f32>(gbvvx[gz43f + 12], gbvvx[gz43f + 13], gbvvx[gz43f + 14]);
    var cn: vec3<f32> = vec3<f32>(gbvvx[gz43f + 21], gbvvx[gz43f + 22], gbvvx[gz43f + 23]);

    let gnmbas: vec3<f32> = vec3<f32>(gbvvx[gz43f + 27], gbvvx[gz43f + 28], gbvvx[gz43f + 29]);

    let flatdot = dot(gnmbas, glhkgw.glfngw);

    let hjgf = min(a.x, min(b.x, c.x));
    let hjg9o = min(a.y, min(b.y, c.y));
    let g9lko = max(a.x, max(b.x, c.x));
    let g9as = max(a.y, max(b.y, c.y));

    var gz4lkefq = x4x7qr(a, b, c);

    if gz4lkefq < 0 {
        var x4vv7qr = cn;
        cn = bn;
        bn = x4vv7qr;
        x4vv7qr = c ;
        c = b;
        b = x4vv7qr;
        gz4lkefq = x4x7qr(a, b, c);
    }


    for (var i = hjg9o ; i <= g9as ; i += 1.0) {
        for (var j = hjgf ; j <= g9lko ; j += 1.0) {

            let p = vec3<f32>(j, i, 0);
            let w0 = x4x7qr(p, b, c);
            let w1 = x4x7qr(p, c, a);
            let w2 = x4x7qr(p, a, b);

            var vvpqr = false;
            var vv9wr = false;
            var vs9wr = false;

            if w0 == 0 && vskj6r(b, c) { vvpqr = true; }
            if w1 == 0 && vskj6r(c, a) { vv9wr = true; }
            if w2 == 0 && vskj6r(a, b) { vs9wr = true; }

            let vsb6r = (w0 > 0 || vvpqr) && (w1 > 0 || vv9wr) && (w2 > 0 || vs9wr);

            if vsb6r {
                let sblk6r = w0 / gz4lkefq ;
                let sb16r = w1 / gz4lkefq ;
                let b16lb = w2 / gz4lkefq ;

                let b06lb = u32(i * f32(eghrf.ghrf) + j);
                let b05lb = atomicLoad(&gw2vx.values[b06lb]);
                let b05la = sblk6r * a[2] + sb16r * b[2] + b16lb * c[2];
                let b0sx = cghfs((b05la-1)*-1);
                
                var b8hsx : bool = false;
                if(glhkgw.klbvx == 1.0){
                    if(b05lb < b0sx){
                        atomicStore(&gw2vx.values[b06lb],b0sx);
                        b8hsx = true;
                    }
                }else{
                    if(b05lb == b0sx){
                        b8hsx = true;
                    }
                }

                if (b8hsx) {

                    let b8haq = vec3<f32>(sblk6r * an[0] + sb16r * bn[0] + b16lb * cn[0],
                        sblk6r * an[1] + sb16r * bn[1] + b16lb * cn[1],
                        sblk6r * an[2] + sb16r * bn[2] + b16lb * cn[2]);

                    let b5hq = normalize(b8haq);
                    let b5h7t = max(0, dot(glhkgw.glfngw, b5hq));
                    var dot = 0.0;
                    if glhkgw.ldgjj == 1 {
                        dot = flatdot;
                    } else {
                        dot = b5h7t;
                    }
                    let brightness = glhkgw.ldfg + (1.0 - glhkgw.ldfg) * dot;

                    let jhx    = (sblk6r * gbvvx[gz43f + 6] + sb16r * gbvvx[gz43f + 15] + b16lb * gbvvx[gz43f + 24]) * brightness / 255.0;
                    let jhkd  = (sblk6r * gbvvx[gz43f + 7] + sb16r * gbvvx[gz43f + 16] + b16lb * gbvvx[gz43f + 25]) * brightness / 255.0;
                    let jhhb   = (sblk6r * gbvvx[gz43f + 8] + sb16r * gbvvx[gz43f + 17] + b16lb * gbvvx[gz43f + 26]) * brightness / 255.0;

                    let bdfsz = eghrf.ghrf * eghrf.gighw;
                    let bdfkm = eghrf.gogg * eghrf.gighw;

                    let bbv1 = u32(j) * eghrf.gighw;
                    let bb98z = bbv1 + eghrf.gighw;
                    let jhnnx = u32(i) * eghrf.gighw;
                    let jhox = jhnnx + eghrf.gighw;
                    for (var y = jhnnx; y < jhox; y++) {
                        for (var x = bbv1; x < bb98z; x++) {
                            textureStore(outputTex, vec2<i32>(i32(x), i32(y)), vec4<f32>(jhx, jhkd, jhhb, 1.0));
                        }
                    }
                }
            }
        }
    }
}

@compute @workgroup_size(64)
fn main_mesh(@builtin(global_invocation_id) id: vec3<u32>){

    if(glhkgw.vxbrds != 1){
        return;
     }

    let gz43f = id.x * 30;

    if (gz43f + 30 > arrayLength(&gbvvx)) { return; }

    var a: vec3<f32> = vec3<f32>(gbvvx[gz43f], gbvvx[gz43f + 1], gbvvx[gz43f + 2]);
    var b: vec3<f32> = vec3<f32>(gbvvx[gz43f + 9], gbvvx[gz43f + 10], gbvvx[gz43f + 11]);
    var c: vec3<f32> = vec3<f32>(gbvvx[gz43f + 18], gbvvx[gz43f + 19], gbvvx[gz43f + 20]);
    hsbef(a,b);
    hsbef(b,c);
    hsbef(c,a);
}

@compute @workgroup_size(64)
fn main_grid(@builtin(global_invocation_id) id: vec3<u32>) {

    if(glhkgw.brmds != 1){
        return;
       }

    if( id.x > u32(glhkgw.vxbzcv)) {
        return;
    }

    let gz43f = id.x * 12;

    var lkef = gsx3f[gz43f];
    var lkeq = gsx3f[gz43f + 1];
    var lk5t = gsx3f[gz43f + 2];

    var lk = gsx3f[gz43f + 6];
    var hjk = gsx3f[gz43f + 7];
    var h5x = gsx3f[gz43f + 8];

    var r = gsx3f[gz43f + 3];
    var g = gsx3f[gz43f + 4];
    var b = gsx3f[gz43f + 5];

    var hxbef = false;
    if (abs(hjk - lkeq) > abs(lk - lkef)) {
        hxbef = true;
        var t = lkeq;
        lkeq = lkef;
        lkef = t;
        t = hjk;
        hjk = lk;
        lk = t;
    }

    if (lk < lkef) {
        var t = lkef;
        lkef = lk;
        lk = t;
        t = lkeq;
        lkeq = hjk;
        hjk = t;
        t = lk5t;
        lk5t = h5x;
        h5x = t;
    }

    let hvcb = lk - lkef;
    let hkm = hjk - lkeq;
    let axsf = h5x - lk5t;
    let m = hkm / hvcb;
    let m_z = axsf / hvcb;

    for (var x = 1u ; x < u32(hvcb) ; x += 1) {
        let y = m*f32(x) + lkeq;
        let z = m_z*f32(x) + lk5t;
        var b06lb: u32;
        var xc: u32;
        var yc: u32;
        if (hxbef) {
            xc = u32(floor(y));
            yc = (x + u32(lkef));
            b06lb = eghrf.ghrf * (x + u32(lkef)) + u32(round(y));
        } else {
            xc = (x + u32(lkef));
            yc = u32(floor(y));
            b06lb = eghrf.ghrf * u32(round(y)) + x + u32(lkef);
        }
        let b05lb = atomicLoad(&gw2vx.values[b06lb]);
        var gxvfsf: u32;
        gxvfsf = cghfs((z-1)*-1);

        var b8hsx : bool = false;
        if(glhkgw.klbvx == 1.0){
            if(b05lb < gxvfsf){
                atomicStore(&gw2vx.values[b06lb],gxvfsf);
                b8hsx = true;
            }
        }else{
            if(b05lb == gxvfsf){
                b8hsx = true;
            }
        }
        
        if (b8hsx) {
            let y_down = floor(y);
            let y_up = y+1;
            let vfdsf = abs(y_up - y) ;
            let vvc3x = 1 - vfdsf;
            var vvlkx: f32;
            if(glhkgw.ldfh == 0){
                 vvlkx = ( z + 1 ) * 0.5 * 0.6;
            }else{
                 vvlkx = ( z + 1 ) * 0.6;
            }
            let sblk6r_down  = vfdsf * vvlkx;
            let sblk6r_up    = vvc3x   * vvlkx;
            let cbdc  = vec4<f32>((r * sblk6r_down)/256, (g * sblk6r_down)/256, (b * sblk6r_down)/256, 1.0);
            let cb4f    = vec4<f32>((r * sblk6r_up)/256, (g * sblk6r_up)/256, (b * sblk6r_up)/256, 1.0);

            let cbqw =  xc * eghrf.gighw;
            let cbres =  yc * eghrf.gighw;
            let cbrmn   = cbqw + eghrf.gighw;
            let cbrgq   = cbres + eghrf.gighw;   
            for(var yp = cbres; yp < cbrgq; yp+=1){
                for(var xp = cbqw; xp < cbrmn; xp+=1){
                    textureStore(outputTex, vec2<i32>(i32(xp), i32(yp)), cbdc);
                    textureStore(outputTex, vec2<i32>(i32(xp), i32(yp + eghrf.gighw)), cb4f);
                }
            } 
        }
    }
}

fn hsbef(a: vec3<f32>, b: vec3<f32>){


    var gray_val = f32(50);

    if(glhkgw.vxbtgb != 1){
        gray_val = f32(100);
    }

    var lkef = a[0];
    var lkeq = a[1];
    var lk5t = a[2];

    var lk = b[0];
    var hjk = b[1];
    var h5x = b[2];

    var hxbef: bool = false;
    if( abs( hjk - lkeq ) >  abs( lk - lkef ) ){
          hxbef = true;
          var t = lkeq;
          lkeq = lkef;
          lkef = t;
          t = hjk;
          hjk = lk;
          lk = t;
    }

    if( lk < lkef){
        var t = lkef;
        lkef = lk;
        lk = t;
        t = lkeq;
        lkeq = hjk;
        hjk = t;
        t = lk5t;
        lk5t = h5x;
        h5x = t;
    }

    var hvcb = lk - lkef;
    var hkm = hjk - lkeq;
    var axsf = h5x - lk5t;
    var m = hkm/hvcb;
    var m_z = axsf/hvcb;

    for(var x = 1u; x < u32(hvcb); x+=1){
        let y = m*f32(x) + lkeq;
        let z = m_z*f32(x) + lk5t;
        var b06lb: u32;
        var xp:u32;
        var yp:u32;
        if(hxbef){
            xp = u32(floor(y)) ;
            yp = x + u32(lkef);
        }else{
            xp = x + u32(lkef);
            yp = u32(floor(y));
        }
        b06lb = eghrf.ghrf*yp + xp;
        let b05lb = atomicLoad(&gw2vx.values[b06lb]);
        var gxvfsf: u32;
        gxvfsf = cghfs((z-1)*-1 - 0.001);
       
        if (b05lb < gxvfsf) {
            let color  = vec4<f32>((gray_val/256), (gray_val/256), (gray_val/256), 1.0);
            let cbqw =  xp * eghrf.gighw;
            let cbres =  yp * eghrf.gighw;
            let cbrmn   = cbqw + eghrf.gighw;
            let cbrgq   = cbres + eghrf.gighw;   
            for(var j = cbres; j < cbrgq; j+=1){
                for(var i = cbqw; i < cbrmn; i+=1){
                    textureStore(outputTex, vec2<i32>(i32(i), i32(j)), color);     
                }
            } 
        }
    }
}

     
fn x4x7qr(a: vec3<f32>, b: vec3<f32>, c: vec3<f32>) -> f32 {
    let val = (c[0] - a[0]) * (b[1] - a[1]) - (b[0] - a[0]) * (c[1] - a[1]);
    return val;
}

fn vskj6r(a: vec3<f32>, b: vec3<f32>) -> bool {
    if a[1] == b[1] {
        return a[0] < b[0];
    }
    return a[1] < b[1];
}

fn cghfs(val: f32) -> u32 {
    let bits = bitcast<u32>(val);
    return select(bits ^ 0xFFFFFFFFu, bits ^ 0x80000000u, val < 0.0);
}

fn xwsam(u: u32) -> f32 {
    let bits = select(u ^ 0xFFFFFFFFu, u & 0x7FFFFFFFu, (u & 0x80000000u) != 0u);
    return bitcast<f32>(bits);
}

fn pack_rgba_to_u32(r: u32, g: u32, b: u32, a: u32) -> u32 {
    return (a << 24u) | (b << 16u) | (g << 8u) | r;
}