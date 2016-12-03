/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


// objets

var copperLinkClass = Class.create({
    initialize: function(obj) {
        this.signal=obj.signal;
        this.target=obj.target;
        this.onAction=obj.onAction;
        this.offAction=obj.offAction;
        this.state=null;
        this.process();
        },
        
        
    process : function(){
        var state=this.signal.getState();
        if (state===this.state)
            return;
        this.state=state;
        if (state===false || state===true)
            if (state)
                this.target[this.onAction]();
            else
                this.target[this.offAction]();
        else
           this.target[this.onAction](state);
    }
});

var copperLinksClass = Class.create({
    initialize: function() {
        this.links=[];
        },
    
    addLink : function(obj) {
        this.links.push(new copperLinkClass(obj));
        },
        
    process : function(){
        for (var i=0;i<this.links.length;i++)
            this.links[i].process();
        }
});

var projectContainerClass = Class.create({
    initialize: function(obj) {
        this.title=obj.title;
        this.auteur=obj.auteur;
        this.images=obj.images;
        this.canvas=obj.canvas;
        this.scene=obj.scene;
        this.actors=obj.actors;
        this.plc=obj.plc;
        this.clock=obj.clock;
        this.links=obj.links;
        },
        
    loadImages : function(unloaded) {    
        for (var elem in this.images ) {
            this.images[elem] = { src : this.images[elem], img : loadImage(this.images[elem],unloaded) };
            }
        },
    
    attachCanvas : function () {
        for (var elem in this.canvas ) {
            this.canvas[elem] = new canvasClass(this.canvas[elem]);
            }
        },
        
    canvasImageClass : function (obj){
        var o= new canvasImageClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { image : this.images[obj.image]});
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
        
     ropeClass : function (obj){
        var o= new ropeClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         objA : this.actors[obj.objA],
                                         objB : this.actors[obj.objB],
                                         offsetA : obj.offsetA,
                                         offsetB : obj.offsetB
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        }, 

     horizontalMovingImageClass : function (obj){
        var o= new horizontalMovingImageClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         image      : this.images[obj.image],
                                         leftSpeed  : obj.leftSpeed,
                                         rightSpeed : obj.rightSpeed,
                                         limits     : obj.limits
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
        
        
   horizontalPneumaticMovingImageClass : function (obj){
        var o= new horizontalPneumaticMovingImageClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         image      : this.images[obj.image],
                                         direction  : obj.direction,
                                         leftSpeed  : obj.leftSpeed,
                                         rightSpeed : obj.rightSpeed,
                                         limits     : obj.limits
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
        
    verticalMovingImageClass : function (obj){
        var o= new verticalMovingImageClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         image      : this.images[obj.image],
                                         upSpeed  : obj.upSpeed,
                                         downSpeed : obj.downSpeed,
                                         limits     : obj.limits
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
 
     movingImageClass : function (obj){
        var o= new movingImageClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         image      : this.images[obj.image],
                                         leftSpeed  : obj.leftSpeed,
                                         rightSpeed : obj.rightSpeed,
                                         upSpeed    : obj.upSpeed,
                                         downSpeed  : obj.downSpeed,
                                         limits     : obj.limits
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
        
    pushButtonImageClass : function (obj){
        var o= new pushButtonImageClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         onImage    : this.images[obj.onImage],
                                         offImage   : this.images[obj.offImage]
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
        
    memoButtonImageClass : function (obj){
        var o= new memoButtonImageClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         onImage    : this.images[obj.onImage],
                                         offImage   : this.images[obj.offImage]
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
    twoStateImageIndicatorClass : function (obj){
        var o= new twoStateImageIndicatorClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         onImage    : this.images[obj.onImage],
                                         offImage   : this.images[obj.offImage],
                                         locations  : ("locations" in obj) ? obj.locations : [[{x:obj.location.x,y:obj.location.y}],[{x:obj.location.x,y:obj.location.y}]]
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
        
        
    valveSimulatorClass : function (obj){
        var o= new valveSimulatorClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         onImage    : this.images[obj.onImage],
                                         offImage   : this.images[obj.offImage],
                                         flow       : obj.flow
                                     }
                                 );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
        
    tankSimulatorClass : function (obj){
        var o= new tankSimulatorClass( 
                                     { 
                                         onImage    : this.images[obj.onImage],
                                         offImage   : this.images[obj.offImage],
                                         inFlow     : this.actors[obj.inFlow],
                                         outFlow    : this.actors[obj.outFlow]
                                     }
                                 );
        return o;
        },
        
    levelIndicatorClass : function (obj){
        var o= new levelIndicatorClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         target     : this.actors[obj.target],
                                         lowLevel   : obj.lowLevel,
                                         highLevel   : obj.highLevel
                                     }
                                 );
        return o;
        },
    levelSwitchClass : function (obj){
    var o= new levelSwitchClass( this.canvas[obj.canvas], 
                                 obj.location,
                                 { 
                                     target     : this.actors[obj.target],
                                     lowLevel   : obj.lowLevel,
                                     highLevel   : obj.highLevel
                                 }
                             );
    return o;
    }, 
    soundClass : function (obj){
    var o= new soundClass( this.canvas[obj.canvas], 
                                 obj.location,
                                 { 
                                     soundFile : obj.soundFile,
                                     id : obj.id
                                 }
                             );
    return o;
    }, 
    sensorClass : function (obj){
        var o= new sensorClass( obj.cible, this.actors[obj.obstacle], {} );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
    colorSensorClass : function (obj){
        var o= new colorSensorClass( obj.cible, this.actors[obj.obstacle], { color : "white"} );
        if (obj.draw==null)
            obj.draw=true;
        if (obj.draw) 
            o.draw();
        return o;
        },
     attach : function (obj,elem) {
        if (obj[elem].type in this) 
            eval("obj[elem] = this."+obj[elem].type+"(obj[elem])");
   /*     switch (obj[elem].type){
            case "canvasImageClass":
                 obj[elem] = this.canvasImageClass(obj[elem]);
                break;
            case "horizontalMovingImageClass":
                 obj[elem] = this.horizontalMovingImageClass(obj[elem]);
                break;
            case "pushButtonImageClass":
                 obj[elem] = this.pushButtonImageClass(obj[elem]);
                break;
            case "twoStateImageIndicatorClass":
                 obj[elem] = this.twoStateImageIndicatorClass(obj[elem]);
                break;
             case "valveSimulatorClass":
                 obj[elem] = this.valveSimulatorClass(obj[elem]);
                break;    
             case "tankSimulatorClass":
                 obj[elem] = this.tankSimulatorClass(obj[elem]);
                break;     
             case "levelIndicatorClass":
                 obj[elem] = this.levelIndicatorClass(obj[elem]);
                break;   
             case "levelSwitchClass":
                 obj[elem] = this.levelSwitchClass(obj[elem]);
                break;   
             case "soundClass":
                 obj[elem] = this.soundClass(obj[elem]);
                break;    
            case "sensorClass":
                 obj[elem] = this.sensorClass(obj[elem]);
                break;
            }*/
        },

        
     attachScene : function () {
        for (var elem in this.scene ) {
            this.attach(this.scene,elem);
            }
        },

        
     attachActors : function () {
        for (var elem in this.actors ) {
            this.attach(this.actors,elem);
            }
        },      
        
     run : function () {
        this.attachCanvas();
        this.attachScene();
        this.attachActors();
        this.copperLinks=new copperLinksClass();
        
        if (this.links!=null) 
            for (var i=0; i<this.links.length;i++)
                this.copperLinks.addLink({ signal : this.actors[this.links[i].signal],
                                       target : this.actors[this.links[i].target],
                                       onAction: this.links[i].onAction,
                                       offAction: this.links[i].offAction
                                    });
        
        this.plc = new plcClass( this.canvas[this.plc.canvas], this.plc.location, this.actors );    
        this.plc.attach(_declare);
        this.plc.loadProgram(_program);

        var processList=this.clock.processList;
        this.clock= new scheduler(this.clock.delay);

        for (var i=0; i<processList.length;i++ ) {
            this.clock.attachProcess(this.actors[processList[i]]);
            }
            
        if (this.copperLinks.links.length>0)
            this.clock.attachProcess(this.copperLinks);
        
        this.clock.attachProcess(this.plc);
        this.clock.run();
        this.plc.run(); 
     }     
    });
    
