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
        if (state)
            this.target[this.onAction]();
        else
            this.target[this.offAction]();
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
        if (obj.draw) 
            o.draw();
        return o;
        },

    twoStateImageIndicatorClass : function (obj){
        var o= new twoStateImageIndicatorClass( this.canvas[obj.canvas], 
                                     obj.location,
                                     { 
                                         onImage    : this.images[obj.onImage],
                                         offImage   : this.images[obj.offImage]
                                     }
                                 );
        if (obj.draw) 
            o.draw();
        return o;
        },
        
    sensorClass : function (obj){
        var o= new sensorClass( obj.cible, this.actors[obj.obstacle], {} );
        if (obj.draw) 
            o.draw();
        return o;
        },

     attach : function (obj,elem) {
        switch (obj[elem].type){
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
                
                
                
            case "sensorClass":
                 obj[elem] = this.sensorClass(obj[elem]);
                break;
            }
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
    
