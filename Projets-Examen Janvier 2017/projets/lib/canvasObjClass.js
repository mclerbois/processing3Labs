/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var canvasClass = Class.create({
    initialize: function(obj) {
        this.id=obj.id;
        this.container=obj.container;
        this.element= (obj.id!=null) ? $(obj.id) : null;
    
        if (this.element!=null) {
            this.element.width=obj.width;
            this.element.height=obj.height;
            
            var c=jQuery('#'+this.container);
            c.css("width",this.element.width);
            c.css("height",this.element.height);
            }
    
        this.onclick=false;
        this.onClickTargets=[];
        this.onmousedown=false;
        this.onMouseDownTargets=[];
        this.onmouseup=false;
        this.onMouseUpTargets=[];
        
        this.context= (this.element!=null) ? this.element.getContext("2d") : null;  
    
        if (this.context!=null)
            this.element.owner=this;
    
    },
    
    clear: function() {
        if (this.context!=null)
            this.context.clearRect(0, 0, this.element.width, this.element.height);
        },
    
    rectangle: function(x,y,l,h,attrs) {
        if (this.context!=null){
            this.context.beginPath();
            this.context.rect(x,y,l,h);
            objCopy(attrs,this.context);
            this.context.fill();
            this.context.stroke();
        }
    },
    
    cercle: function(cx,cy,r,attrs) {
        if (this.context!=null){
            this.context.beginPath();
            this.context.arc(cx,cy,r,0,2*Math.PI,true);
            objCopy(attrs,this.context);
            this.context.fill();
            this.context.stroke();
        }
    },
    
    xyline: function(x1,y1,x2,y2,attrs) {
        if (this.context!=null){
            this.context.beginPath();
            objCopy(attrs,this.context);
            this.context.moveTo(x1,y1);
            this.context.lineTo(x2,y2);
            this.context.stroke();
        }
    },
    
    drawImage: function(image,x,y) {
        if (this.context!=null)
            this.context.drawImage(image.img,x,y);
    },
    
    addClickTarget: function(target) {
        if (this.context!=null){
            this.onClickTargets.push(target);
            if (this.onclick==false) {
            
                this.element.onclick=function (e){
        
                    var container=$(this.owner.container);
                    var x = e.pageX - container.offsetLeft;
                    var y = e.pageY - container.offsetTop;

                    for (var i=0;i<this.owner.onClickTargets.length;i++)
                        this.owner.onClickTargets[i].onClick(x,y);
                };
            
                this.onclick=true;
            }
        }
    },
    
    addMouseUpTarget: function(target) {
        if (this.context!=null){
            this.onMouseUpTargets.push(target);
       
            if (this.onmouseup==false) {
            
                this.element.onmouseup=function (e){

                    var container=$(this.owner.container);
                    var x = e.pageX - container.offsetLeft;
                    var y = e.pageY - container.offsetTop;

                    for (var i=0;i<this.owner.onMouseUpTargets.length;i++)
                        this.owner.onMouseUpTargets[i].onMouseUp(x,y);
                };  
    
                this.onmouseup=true;
            }
        }
    },
    
    addMouseDownTarget: function(target) {
        if (this.context!=null){
            this.onMouseDownTargets.push(target);
       
            if (this.onmousedown==false) {
            
                this.element.onmousedown=function (e){
        
                    var container=$(this.owner.container);
                    var x = e.pageX - container.offsetLeft;
                    var y = e.pageY - container.offsetTop;

                    for (var i=0;i<this.owner.onMouseDownTargets.length;i++)
                        this.owner.onMouseDownTargets[i].onMouseDown(x,y);
                };     
    
                this.onmousedown=true;
            }
        }
    }
    
});

//============================================================================

var canvasObjClass = Class.create({
    initialize: function(ctx,location,properties) {
        this.ctx=ctx;
        this.location=location;
        this.eraseBeforeDraw=true;
        objCopy(properties,this);
        this.finalize(properties);
        this.limitFlag=false;
        },
        
    finalize : function(properties){
        // réalise d'autres opérations d'initialisation en fonction du type d'élément graphique
        },
        
    applyLimits : function(){
        if (this.limits!=null){ // limits { x1 : 1, y1 : 20, x2 : 40, y2=200}
            var x=this.location.x;
            var y=this.location.y;
            
            
            if (x<this.limits.x1) {
                x=this.limits.x1;
                this.limitFlag=true;
                }
            if (x>this.limits.x2){
                x=this.limits.x2;
                this.limitFlag=true;
                }
            if (y<this.limits.y1){
                y=this.limits.y1;
                this.limitFlag=true;
                }
            if (y>this.limits.y2){
                y=this.limits.y2;
                 this.limitFlag=true;
                }
            this.location.x=x;
            this.location.y=y;
        }
    },
            
    draw : function() {
    // dépend du type d'objet graphique
    },
        
    erase : function() {
        this.ctx.context.clearRect(this.location.x,this.location.y, this.location.l, this.location.h);
        },
        
    moveTo : function(x,y) {
        if (this.eraseBeforeDraw)
            this.erase();
        this.location.x=x;
        this.location.y=y;
        this.applyLimits();
        this.draw();
        },
        
    moveBy : function(dx,dy) {
        if (this.eraseBeforeDraw)
            this.erase();
        this.location.x=this.location.x+dx;
        this.location.y=this.location.y+dy;
        this.applyLimits();
        this.draw();
        },
    
    getX : function() {
        return this.location.x;
        },
    
    getY : function() {
        return this.location.y;
        },
    
    getXY : function() {
        return { x: this.location.x, y: this.location.y} ;
        },
        
    getProperty : function(property) {
        if (this[property]!=null)
            return this[property];
        else 
            return null;   
        },
    
    isProperty : function(property,value) {
        var v=this.getProperty(property);
        if (v==null)
            return false;
        else
            return (v==value);
        },
        
    isInside : function(x,y,cible) {
        return ( (x >= cible.x1) && (x<=cible.x2)) && ( (y >= cible.y1) && (y <= cible.y2) );
    }
});

//============================================================================

var canvasRectangleClass = Class.create(canvasObjClass,{
        
    draw : function() {
        if(this.eraseBeforeDraw)
            this.erase();
        this.ctx.rectangle(this.location.x,this.location.y,this.location.l,this.location.h,this.attrs);
        }
        
});

//============================================================================

var canvasCercleClass = Class.create(canvasObjClass,{
        
    draw : function() {
        if(this.eraseBeforeDraw)
            this.erase();
        this.ctx.cercle(this.location.cx,this.location.cy,this.location.r,this.attrs);
        }
        
});
    
//============================================================================

var canvasImageClass = Class.create(canvasObjClass,{
        
    draw : function() {
        this.drawed=true;
        if(this.eraseBeforeDraw)
            this.erase();
        this.ctx.drawImage(this.image,this.location.x,this.location.y);
        },
       
    hide : function() {
      if (this.drawed)
        this.erase();
        this.drawed=false;
        },
       
    show : function() {
        if (!this.drawed)
            this.draw();
        this.drawed=true;
        }
        
});
        
//============================================================================

var horizontalMovingImageClass = Class.create(canvasImageClass,{
    finalize : function(properties) {
        this.leftMotorState=false;
        this.rightMotorState=false;
        this.motorBits=0;
        },
    
    leftMotorOn : function() {
        this.leftMotorState=true;
        this.motorBits=this.motorBits | 1;   
        },
        
    leftMotorOff : function() {
        this.leftMotorState=false;
        this.motorBits=this.motorBits & 2;
        },
    
    rightMotorOn : function() {
        this.rightMotorState=true;
        this.motorBits=this.motorBits | 2;
        },
        
    rightMotorOff : function() {
       this.rightMotorState=false;
       this.motorBits=this.motorBits & 1;
        },
        
    getState : function() {return this.motorBits;},
    
    setMotors : function (bits) {
        switch (bits) {
            case 0 :
                this.leftMotorState=false;
                this.rightMotorState=false;
                this.motorBits=0;
                break;
            case 1 :
                this.leftMotorState=true;
                this.rightMotorState=false;
                this.motorBits=1;
                break;
            case 2 :
                this.leftMotorState=false;
                this.rightMotorState=true;
                this.motorBits=2;
                break;
            case 3 :
                this.leftMotorState=false;
                this.rightMotorState=false;
                this.motorBits=0;
                break;
            }
        },
        
    process : function(){
        this.speed=0;
        if (this.leftMotorState) {
            if (!this.rightMotorState)
                this.speed=-this.leftSpeed;
            }
        else
            if (this.rightMotorState)
                this.speed=this.rightSpeed;
            
        if (this.speed!=0)
            this.moveBy(this.speed,0);
    }   
});

//============================================================================

var verticalMovingImageClass = Class.create(canvasImageClass,{
    finalize : function(properties) {
        this.upMotorState=false;
        this.downMotorState=false;
        this.motorBits=0;
        },    
        
    upMotorOn : function() {
        this.upMotorState=true;
        this.motorBits=this.motorBits | 4;  
        },
        
    upMotorOff : function() {
        this.upMotorState=false;
        this.motorBits=this.motorBits & 8;  
        },
    
    downMotorOn : function() {
        this.downMotorState=true;
        this.motorBits=this.motorBits | 8;  
        },
        
    downMotorOff : function() {
        this.downMotorState=false;
        this.motorBits=this.motorBits & 4;
        },
    getState : function() {return this.motorBits;},
    
    setMotors : function (bits) {
        switch (bits) {
            case 0 :
                this.upMotorState=false;
                this.downMotorState=false;
                this.motorBits=0;
                break;
            case 4 :
                this.upMotorState=true;
                this.downMotorState=false;
                this.motorBits=4;
                break;
            case 8 :
                this.upMotorState=false;
                this.downMotorState=true;
                this.motorBits=8;
                break;
            case 12 :
                this.upMotorState=false;
                this.downMotorState=false;
                this.motorBits=0;
                break;
            }
        },
        
    process : function(){
        this.speed=0;
        if (this.upMotorState) {
            if (!this.downtMotorState)
                this.speed=-this.upSpeed;
            }
        else
            if (this.downMotorState)
                this.speed=this.downSpeed;
            
        if (this.speed!=0)
            this.moveBy(0,this.speed);
        }   
});

//============================================================================

var movingImageClass = Class.create(canvasImageClass,{
    finalize : function(properties) {
        this.leftMotorState=false;
        this.rightMotorState=false;
        this.upMotorState=false;
        this.downMotorState=false;
        this.motorBits=0;
        },
    
    leftMotorOn : function() {
        this.leftMotorState=true;
        this.motorBits=this.motorBits | 1;
        },
        
    leftMotorOff : function() {
        this.leftMotorState=false;
        this.motorBits=this.motorBits & 0x0E;
        },
    
    rightMotorOn : function() {
        this.rightMotorState=true;
        this.motorBits=this.motorBits | 2;
        },
        
    rightMotorOff : function() {
        this.rightMotorState=false;
        this.motorBits=this.motorBits & 0x0D;
        },
        
    upMotorOn : function() {
        this.upMotorState=true;
        this.motorBits=this.motorBits | 4;
        },
        
    upMotorOff : function() {
        this.upMotorState=false;
        this.motorBits=this.motorBits & 0x0B;
        },
    
    downMotorOn : function() {
        this.downMotorState=true;
        this.motorBits=this.motorBits | 8;
        },
        
    downMotorOff : function() {
        this.downMotorState=false;
        this.motorBits=this.motorBits & 0x07;
        },
        
    getState : function() {return this.motorBits;},
    
    setMotors : function (bits) {
        switch (bits) {
            case 0 :
                this.leftMotorState=false;
                this.rightMotorState=false;
                this.upMotorState=false;
                this.downMotorState=false;
                this.motorBits=0;
                break;
            case 1 :
                this.leftMotorState=true;
                this.rightMotorState=false;
                this.upMotorState=false;
                this.downMotorState=false;
                this.motorBits=1;
                break;
            case 2 :
                this.leftMotorState=false;
                this.rightMotorState=true;
                this.upMotorState=false;
                this.downMotorState=false;
                this.motorBits=2;
                break;
            case 4 :
                this.leftMotorState=false;
                this.rightMotorState=false;
                this.upMotorState=true;
                this.downMotorState=false;
                this.motorBits=4;
                break; 
            case 8 :
                this.leftMotorState=false;
                this.rightMotorState=false;
                this.upMotorState=false;
                this.downMotorState=true;
                this.motorBits=8;
                break;
             default :
                this.leftMotorState=false;
                this.rightMotorState=false;
                this.upMotorState=false;
                this.downMotorState=false;
                this.motorBits=0;
                break;
            }
        },
        
    process : function(){
        this.xspeed=0;
        if (this.leftMotorState) {
            if (!this.rightMotorState)
                this.xspeed=-this.leftSpeed;
            }
        else
            if (this.rightMotorState)
                this.xspeed=this.rightSpeed;
        
        this.yspeed=0;
        if (this.upMotorState) {
            if (!this.downtMotorState)
                this.yspeed=-this.upSpeed;
            }
        else
            if (this.downMotorState)
                this.yspeed=this.downSpeed;    
        
        
        if ((this.xspeed!=0) || (this.yspeed!=0))
            this.moveBy(this.xspeed,this.yspeed);
        }   
});

//============================================================================

var pushButtonImageClass = Class.create(canvasObjClass,{

    finalize : function(properties) {
        this.onImage  = new canvasImageClass(this.ctx,this.location,{ image : properties.onImage } );
        this.offImage = new canvasImageClass(this.ctx,this.location,{ image : properties.offImage } );
        if (this.state==null)
            this.state=false;
        this.ctx.addMouseDownTarget(this);
        this.ctx.addMouseUpTarget(this);
        if (properties.eraseBeforeDraw==null)
            this.eraseBeforeDraw=false;
        else
            this.eraseBeforeDraw=properties.eraseBeforeDraw;
        if (properties.cible==null)
            this.cible={x1:this.location.x, y1: this.location.y, x2:this.location.x+this.location.l,y2:this.location.y+this.location.h};
        else
            this.cible=properties.cibles;
        },
        
    getState : function () { return this.state;},

    draw     : function () {
        if (this.state)
            this.onImage.draw();
        else
            this.offImage.draw();
    },
    
    onMouseDown: function (x,y) {
        var state=this.isInside(x,y,this.cible);
           //( (x >= this.cible.x1) && (x<=this.cible.x2)) && ( (y >= this.cible.y1) && (y <= this.cible.y2) );  
        if (state!=this.state){
            this.state=state;
            if (this.state) 
                this.onImage.draw();
            else
                this.offImage.draw();
            }
        },

    onMouseUp: function (x,y) {
        if (this.state){
            this.state=false;
            this.draw();
            }
        }

    });

//============================================================================

var memoButtonImageClass = Class.create(canvasObjClass,{

    finalize : function(properties) {
        this.onImage  = new canvasImageClass(this.ctx,this.location,{ image : properties.onImage } );
        this.offImage = new canvasImageClass(this.ctx,this.location,{ image : properties.offImage } );
        if (this.state==null)
            this.state=false;
        this.ctx.addClickTarget(this);
        if (properties.eraseBeforeDraw==null)
            this.eraseBeforeDraw=false;
        else
            this.eraseBeforeDraw=properties.eraseBeforeDraw;
        
        if (properties.cible==null)
            this.cible={x1:this.location.x, y1: this.location.y, x2:this.location.x+this.location.l,y2:this.location.y+this.location.h};
        else
            this.cible=properties.cibles;
        },
        
    getState : function () { return this.state;},
    
    draw     : function () {
        if (this.state)
            this.onImage.draw();
        else
            this.offImage.draw();
    },

    onClick: function (x,y) {
        var state=this.isInside(x, y, this.cible);
            //( (x >= this.cible.x1) && (x<=this.cible.x2)) && ( (y >= this.cible.y1) && (y <= this.cible.y2) );  
        if (state){
            this.state=this.state ? false : true;
            if (this.state) 
                this.onImage.draw();
            else
                this.offImage.draw();
            }
        
        }

    });

//============================================================================

var twoStateImageIndicatorClass = Class.create(canvasObjClass,{

    finalize : function(properties) {
        this.onImage  = new canvasImageClass(this.ctx,this.location,{ image : properties.onImage } );
        this.offImage = new canvasImageClass(this.ctx,this.location,{ image : properties.offImage } );
        if (this.state==null)
            this.state=false;
        if (properties.eraseBeforeDraw==null)
            this.eraseBeforeDraw=false;
        else
            this.eraseBeforeDraw=properties.eraseBeforeDraw;
        if ("locations" in properties){
            this.locations=properties.locations;
            this.location.x=this.locations[0][0].x;
            this.location.y=this.locations[0][0].y;
            this.index=0;
            this.asJump=false;
            }
        this.color="black";
        },
        
    jump : function () {
        if (!this.asJump) {
            var z=this.state ? 1 : 0;
            this.index++;
            if (this.index==this.locations[z].length)
                this.index=0;
            this.erase();
            
            this.location.x=this.locations[z][this.index].x;
            this.location.y=this.locations[z][this.index].y;
            this.draw();
            this.asJump=true;
            }
        },    
   
    stay : function () { this.asJump=false;},
    
    getState : function () { return this.state;},
 
    draw     : function () {
        if (this.state)
            this.onImage.draw();
        else
            this.offImage.draw();
    },

    on : function(){
        if (this.state==false){
            this.state=true;
            this.onImage.draw();
            this.color="white";
            }
        },

    off : function(){
        if (this.state){
            this.state=false;
            this.offImage.draw();
            this.color="black";
            }
        },

    toggle : function(){
        if (this.state)
            this.off();
        else
            this.on();
        },
        
    nop : function(){}
    });


//============================================================================

var sensorClass = Class.create(canvasObjClass,{ 
    initialize: function(cible, obstacleObj,properties) {
        this.cible=cible;
        this.obstacleObj=obstacleObj;
        objCopy(properties,this);
        if (this.state==null)
            this.state=false;
        this.finalize(properties);
        },
        
    finalize : function(properties){
        // réalise d'autres opérations d'initialisation en fonction du type d'élément graphique
        },
    
    getState : function () { return this.state;},
    
    process : function() {
        var x=this.obstacleObj.getX();
        var y=this.obstacleObj.getY();
        this.state=this.isInside(x,y,this.cible);
            //( (x >= this.cible.x1) && (x<=this.cible.x2)) && ( (y >= this.cible.y1) && (y <= this.cible.y2) );   
        }
    });

//============================================================================

var colorSensorClass = Class.create(sensorClass,{ 
    process : function() {
       if (this.obstacleObj.isProperty("color",this.color)) {
            var x=this.obstacleObj.getX();
            var y=this.obstacleObj.getY();
            this.state=this.isInside(x,y,this.cible);
                //( (x >= this.cible.x1) && (x<=this.cible.x2)) && ( (y >= this.cible.y1) && (y <= this.cible.y2) );   
            }
        }
    });

//============================================================================

var levelIndicatorClass = Class.create(canvasObjClass,{ 
    finalize: function(properties) {
        this.target=properties.target;
        this.lowLevel=properties.lowLevel;
        this.highLevel=properties.highLevel;
        this.attrs={strokeStyle : "#FF0000", fillStyle : "#ff0000"}
        this.indicatorHeight=123;
        this.indicatorWidth=3;
        this.level=0;
        },
        
    process : function(){
        this.level=this.target.getLevel();
        this.draw();
        },
        
    draw : function() {
        var h=0;
        if (this.level>this.lowLevel) {
            h=(this.level-this.lowLevel)/(this.highLevel-this.lowLevel)*this.indicatorHeight;
            this.ctx.rectangle(this.location.x, this.location.y-123, this.indicatorWidth,123,{strokeStyle : "#FFFFFF", fillStyle : "#FFFFFF"});
            this.ctx.rectangle(this.location.x, this.location.y-h, this.indicatorWidth,h,this.attrs);
            }
        }
});

//============================================================================

var levelSwitchClass = Class.create(canvasObjClass,{ 
    finalize: function(properties) {
        this.target=properties.target;
        this.lowLevel=properties.lowLevel;
        this.highLevel=properties.highLevel;
        this.state=false;
        },
        
    process : function(){
        var h=this.target.getLevel();
        
        if (!this.state && h>this.highLevel)
            this.state=true;
        else
            if (h<this.lowLevel)
                this.state=false;
        },
        
    getState : function() {return this.state;}
        
});


//============================================================================

/*
   { conicBase      : 240,
     conicHeight    : 70,
     cylinderBase   : 240,
     cylinderHeight : 180
   }
 */

var tankSimulatorClass = Class.create({ 
    initialize: function(properties) {
        this.dimensions={   conicBase      : 240,
                            conicHeight    : 70,
                            cylinderBase   : 240,
                            cylinderHeight : 180
                            }
        this.dimensions.surface=Math.PI*this.dimensions.conicBase*this.dimensions.conicBase/4;
        this.dimensions.conicVolume=this.dimensions.surface*this.dimensions.conicHeight/3;
        this.dimensions.cylinderVolume=this.dimensions.surface*this.dimensions.cylinderHeight;
        this.dimensions.volume=this.dimensions.conicVolume+this.dimensions.cylinderVolume;
        this.volume=0;
        this.level=0;
        this.inFlow=properties.inFlow;
        this.outFlow=properties.outFlow;
        },
   
    process : function() {
        this.volume=this.volume+this.inFlow.getFlow(this.volume)+this.outFlow.getFlow(this.volume);
        if (this.volume<0)
            this.volume=0;
        if (this.volume>this.dimensions.volume)
            this.volume=this.dimensions.volume
        if (this.volume<this.dimensions.conicVolume) {
            this.level=this.volume/this.dimensions.surface*3;
            }
        else {
            this.level=this.dimensions.conicHeight+(this.volume-this.dimensions.conicVolume)/this.dimensions.surface;
            }
        },
    
    getLevel  : function() { return this.level;}

});

//============================================================================

var twoImagesClass = Class.create(canvasObjClass,{ 
    initialize: function(properties) {
        this.onImage  = new canvasImageClass(this.ctx,this.location,{ image : properties.onImage } );
        this.offImage = new canvasImageClass(this.ctx,this.location,{ image : properties.offImage } );
        this.state=false;
        this.finalize(properties);
        },
     
    finalize : function () {},
    on    : function () { this.state=true;  this.onImage.draw();},
    off   : function () { this.state=false; this.offImage.draw();},
    
    getState : function () { return this.state;},
    
    draw     : function () {
        if (this.state)
            this.onImage.draw();
        else
            this.offImage.draw();
        }
        
    });
//============================================================================

var valveSimulatorClass = Class.create(canvasObjClass,{ 
    finalize: function(properties) { 
        this.onImage  = new canvasImageClass(this.ctx,this.location,{ image : properties.onImage } );
        this.offImage = new canvasImageClass(this.ctx,this.location,{ image : properties.offImage } );
        this.state=false;
        this.flow=properties.flow;
        if (properties.noFlowIfEmpty!=null)
            this.noFlowIfEmpty=properties.noFlowIfEmpty;
        else
            this.noFlowIfEmpty=false;
        },
        
    open    : function () { this.state=true;  this.onImage.draw();},
    close   : function () { this.state=false; this.offImage.draw();},
    
    getFlow : function (volume) {
        if (this.noFlowIfEmpty && volume<=0)
            return 0;
        else
            return this.state ? this.flow : 0;
        },
    
    draw     : function () {
        if (this.state)
            this.onImage.draw();
        else
            this.offImage.draw();
        }
        
    });
    
 //============================================================================

var soundClass = Class.create(canvasObjClass,{ 
    finalize: function(properties) { 
        this.soundFile=properties.soundFile;
        this.id=properties.id;
        this.embed=document.getElementById(this.id);
        this.oldState=false;
        this.state=false;
        },
        
    on    : function () { 
        this.state=true;
    },
    off   : function () { 
        this.state=false;
    },
    
    process : function () {
        var pulse = this.state && !this.oldstate;
        if (pulse)
            this.embed.innerHTML= "<audio autoplay>"+
            '<source src="'+this.soundFile+'" type="audio/wav">'+
            "Your browser does not support the audio element."+
            "</audio>";
        if (this.oldstate && !this.state)
            this.embed.innerHTML= "";
        this.oldstate=this.state;
        }
        
    });
 //============================================================================

var ropeClass = Class.create(canvasObjClass,{ 
    finalize: function(properties) { 
        this.objA=properties.objA;
        this.objB=properties.objB;
        this.offsetA=properties.offsetA;
        this.offsetB=properties.offsetB;
        this.process();
        },
        
    draw : function () {
        this.erase();
        objCopy(this.newLocation,this.location);
        this.ctx.xyline(this.location.x+1,this.location.y+1,
                            this.location.x+1,
                            this.location.y+this.location.h-1,
                        { strokeStyle : "#000000"}
                    );
        
        },
    
    process : function () {
        var pa = this.objA.getXY();
        var pb = this.objB.getXY();
        this.newLocation = {
            x : pa.x+this.offsetA.x-1,
            y : pa.y+this.offsetA.y-1,
            l : 3,
            h : (pb.y-pa.y) - (this.offsetA.y - this.offsetB.y)+2
            };
        this.draw();
        }
        
    });
    
    
//============================================================================

var horizontalPneumaticMovingImageClass = Class.create(horizontalMovingImageClass,{
    finalize : function(properties) {
        this.leftMotorState=false;
        this.rightMotorState=false;
        this.airFlow=false;
        this.direction=properties.direction; // 1 right, -1 left
        this.motorBits=0;
        },
        
    applyPressure : function() {
        if (!this.airFlow) {
            this.airFlow=true;
            this.leftMotorOff();
            this.rightMotorOff();
            if (this.direction==1)
                this.rightMotorOn();
            else 
                this.leftMotorOn();
            }
        },
        
    releasePressure : function() {
        if (this.airFlow) {
            this.airFlow=false;
            this.leftMotorOff();
            this.rightMotorOff();
            if (this.direction==1)
                this.leftMotorOn();
            else 
                this.rightMotorOn();
            }
        },
        
    process : function($super){
        $super();
        if (this.limitFlag) {
            this.leftMotorOff();
            this.rightMotorOff();
            }
        this.limitFlag=false;
        }   
});