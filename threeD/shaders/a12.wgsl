

@group(0) @binding(11)
var<storage,read_write> screenPolygonArray: array<u32>;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) id: vec3<u32>){

    if(id.x > 0){
        return;
    }

    screenPolygonArray[0] = 1;
    screenPolygonArray[1] = 1;
    screenPolygonArray[2] = 1;
    screenPolygonArray[3] = 1;
    screenPolygonArray[4] = 1;
    screenPolygonArray[5] = 1;
    screenPolygonArray[6] = 1;
    screenPolygonArray[7] = 1;
    screenPolygonArray[8] = 1;
    screenPolygonArray[9] = 1;
    screenPolygonArray[10] = 1;
    screenPolygonArray[11] = 1;
    screenPolygonArray[12] = 1;
    screenPolygonArray[13] = 1;
    screenPolygonArray[14] = 1;
    screenPolygonArray[15] = 1;
    screenPolygonArray[16] = 1;
    screenPolygonArray[17] = 1;
    screenPolygonArray[18] = 1;
    screenPolygonArray[19] = 1;
   
}