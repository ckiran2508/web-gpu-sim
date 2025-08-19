const LBar ={

    hingePoint:null,
    cmPoint:null,
    mass:null,
    invMass:null,
    length:null,
    angle:null,
    arm1:null,
    arm2:null,
    moiAtHinge:null,
    inverseMoiAtHinge: null,

    create: function(x,y,length,angle,mass){
       var lbar                   = Object.create(this)
       lbar.hingePoint            = Vector.create(x,y)
       lbar.arm1                  = Rod.create(x,y,length,angle,mass/2)
       lbar.arm2                  = Rod.create(x,y,length,angle + Math.PI/3, mass/2)
       lbar.angle                 = angle 
       lbar.mass                  = mass
       lbar.invMass               = 1/mass
       lbar.length                = length
       lbar.moiAtHinge            = mass * length * length /3
       lbar.invMoiAtHinge         = 3 / (mass * length * length)
       lbar.arm1.omega            = 0
       lbar.arm2.omega            = 0
       return lbar;
    },

    // setCm: function(){
    //   var arm1VHalf = Vector.clone(this.arm1)
    //   var arm2VHalf = Vector.clone(this.arm2)
    //   arm1VHalf.scale(0.5)
    //   arm2VHalf.scale(0.5)
    //   var diffVectorHalf = Vector.VectorDiff(arm2VHalf,arm1VHalf)
    //   diffVectorHalf.scale(0.5)
    //   this.cmPoint =  Vector.VectorSum(arm2VHalf,diffVectorHalf)
    //   this.cmPoint.addTo(this.hingePoint)
    // },

    updateOnGravity: function(gravity){
        var forceVector = gravity.scaledVector(this.mass)
        var rVector1 = Vector.VectorDiff(this.arm1.position,this.arm1.end)
        var rVector2 = Vector.VectorDiff(this.arm2.position,this.arm2.end)
        var totalTorque = Vector.crossProduct(rVector1,forceVector) + Vector.crossProduct(rVector2,forceVector)
        var angularAcceleration = totalTorque * this.invMoiAtHinge
        this.arm1.omega+=angularAcceleration
        this.arm2.omega+=angularAcceleration
    },

    getVelocity: function(){
        return this.arm1.velocity
    },

    getOmega: function(){
        return this.arm1.omega
    },

    setVelocity: function(velocity){
        this.arm1.velocity = velocity
        this.arm2.velocity = velocity
    },

    setOmega:function(omega){
        this.arm1.omega = omega
        this.arm2.omega = omega
    },

    transform: function(){
       this.arm1.transform()
       this.arm2.transform()
    },


    draw: function(c){
       c.beginPath()
       c.moveTo(this.arm1.end._x, this.arm1.end._y)
       c.lineTo(this.hingePoint._x,this.hingePoint._y)
       c.lineTo(this.arm2.end._x, this.arm2.end._y)
       c.lineTo(this.arm1.end._x, this.arm1.end._y)
       c.stroke()
    }
}