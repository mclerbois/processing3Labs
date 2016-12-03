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
        },
        
    finalize : function(properties){
        // réalise d'autres opérations d'initialisation en fonction du type d'élément graphique
        },
        
    applyLimits : function(){
        if (this.limits!=null){ // limits { x1 : 1, y1 : 20, x2 : 40, y2=200}
            var x=this.location.x;
            var y=this.location.y;
            if (x<this.limits.x1)
                x=this.limits.x1;
            if (x>this.limits.x2)
                x=this.limits.x2;
            if (y<this.limits.y1)
                y=this.limits.y1;
            if (y>this.limits.y2)
                y=this.limits.y2;
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
        this.location.y=this.location.x+dy;
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
        if(this.eraseBeforeDraw)
            this.erase();
        this.ctx.drawImage(this.image,this.location.x,this.location.y);
    }
        
});
        
//============================================================================

var horizontalMovingImageClass = Class.create(canvasImageClass,{
    finalize : function(properties) {
        this.leftMotorState=false;
        this.rightMotorState=false;
        },
    
    leftMotorOn : function() {
        this.leftMotorState=true;
        
        },
        
    leftMotorOff : function() {
        this.leftMotorState=false;
        },
    
    rightMotorOn : function() {
        this.rightMotorState=true;
        },
        
    rightMotorOff : function() {
       this.rightMotorState=false;
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
        },    
        
    upMotorOn : function() {
        this.upMotorState=true;
        },
        
    upMotorOff : function() {
        this.upMotorState=false;
        },
    
    downMotorOn : function() {
        this.downMotorState=true;
        },
        
    downMotorOff : function() {
        this.downMotorState=false;
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
        },
    
    leftMotorOn : function() {
        this.leftMotorState=true;
        },
        
    leftMotorOff : function() {
        this.leftMotorState=false;
        },
    
    rightMotorOn : function() {
        this.rightMotorState=true;
        },
        
    rightMotorOff : function() {
        this.rightMotorState=false;
        },
        
    upMotorOn : function() {
        this.upMotorState=true;
        },
        
    upMotorOff : function() {
        this.upMotorState=false;
        },
    
    downMotorOn : function() {
        this.downMotorState=true;
        },
        
    downMotorOff : function() {
        this.downMotorState=false;
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
        var state=( (x >= this.cible.x1) && (x<=this.cible.x2)) && ( (y >= this.cible.y1) && (y <= this.cible.y2) );  
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
        },
        
    getState : function () { return this.state;},
    
    draw     : function () {
        if (this.state)
            this.onImage.draw();
        else
            this.offImage.draw();
    },

    onClick: function (x,y) {
        var state=( (x >= this.cible.x1) && (x<=this.cible.x2)) && ( (y >= this.cible.y1) && (y <= this.cible.y2) );  
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
        },
        
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
            }
        },

    off : function(){
        if (this.state){
            this.state=false;
            this.offImage.draw();
            }
        },

    toggle : function(){
        if (this.state)
            this.off();
        else
            this.on();
        }
    });

//============================================================================

var sensorClass = Class.create({ 
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
        this.state=( (x >= this.cible.x1) && (x<=this.cible.x2)) && ( (y >= this.cible.y1) && (y <= this.cible.y2) );   
        }
    });




