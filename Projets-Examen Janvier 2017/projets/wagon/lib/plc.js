/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//============================================================================
var plcSFTClass = Class.create({ 
    
    initialize: function() {
        this.data=false;
        this.shiftRegister=[
                            false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false
                           ];
        this.clock=false;
        this.oldClock=false;
        this.pulse=false;
        this.reset=false;
        this.process();
        },
        
    process : function() {
        this.pulse=(this.clock && !this.oldClock);
        if (this.reset) {
            this.shiftRegister=[
                            false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false
                           ];
            }
        if (this.pulse) {
            var i=this.shiftRegister.length-1;
                while (i!=0){
                    this.shiftRegister[i]=this.shiftRegister[i-1];
                    i--;
                    }
                this.shiftRegister[0]=this.data;
            }
        this.oldCoil=this.coil;
        },   
        
    setMemory : function() {
        return {    d    : this.data, 
                    c    : this.clock,
                    r    : this.reset,
                    
                    v0   :    this.shiftRegister[0],
                    v1   :    this.shiftRegister[1],
                    v2   :    this.shiftRegister[2],
                    v3   :    this.shiftRegister[3],
                    v4   :    this.shiftRegister[4],
                    v5   :    this.shiftRegister[5],
                    v6   :    this.shiftRegister[6],
                    v7   :    this.shiftRegister[7],
                    v8   :    this.shiftRegister[8],
                    v9   :    this.shiftRegister[9],
                    v10  :    this.shiftRegister[10],
                    v11  :    this.shiftRegister[11],
                    v12  :    this.shiftRegister[12],
                    v13  :    this.shiftRegister[13],
                    v14  :    this.shiftRegister[14],
                    v15  :    this.shiftRegister[15]
                    }
        },
        
    getMemory : function(obj) {   
        this.data=obj.d;
        this.clock=obj.c;
        this.reset=obj.r;
        for (var i=0;i<16;i++)
            this.shiftRegister[i]=obj["v"+i];
        }
    });



//============================================================================
var plcCNTClass = Class.create({ 
    
    initialize: function(value) {
        this.coil=false;
        this.oldCoil=false;
        this.contact=false;
        this.pulse=false;
        this.value=value;
        this.count=value;
        this.reload=false;
        this.process();
        },
        
    process : function() {
        this.pulse=(this.coil && !this.oldCoil);
        if (this.reload) {
            this.count=this.value;
            }
        if (this.pulse && (this.count!=0))
            this.count--;
        this.contact= (this.count==0);
        this.oldCoil=this.coil;
    },   
        
    setMemory : function() {
        return {    coil    : this.coil, 
                    contact : this.contact,
                    reload  : false,
                    set v(state)    {this.coil=state;},
                    get v()         {return this.contact;},
                    
                    set r(state)    {this.reload=state;},
                    get r()         {this.reload;}
                    }
        },
        
    getMemory : function(obj) {   
        this.coil=obj.coil;
        this.reload=obj.reload;
        }
    });




//============================================================================

var plcDIFUClass = Class.create({ 
    
    initialize: function() {
        this.coil=false;
        this.oldCoil=false;
        this.contact=false;
        this.process();
        },
        
    process : function() {
        this.contact=(this.coil && !this.oldCoil);
        this.oldCoil=this.coil;
    },   
        
    setMemory : function() {
        return {    coil    : this.coil, 
                    contact : this.contact,
                    set v(state)    {this.coil=state;},
                    get v()         {return this.contact;}
                    }
        },
        
    getMemory : function(obj) {   
        this.coil=obj.coil;
        }
    });

//============================================================================

var plcDIFDClass = Class.create({ 
    
    initialize: function() {
        this.coil=false;
        this.oldCoil=false;
        this.contact=false;
        this.process();
        },
        
    process : function() {
        this.contact=(!this.coil && this.oldCoil);
        this.oldCoil=this.coil;
        },   
        
    setMemory : function() {
        return {    coil    : this.coil, 
                    contact : this.contact,
                    set v(state)    {this.coil=state;},
                    get v()         {return this.contact;}
                    }
        },
        
    getMemory : function(obj) {   
        this.coil=obj.coil;
        }
    });

//============================================================================

var plcInputClass = Class.create({ 
    
    initialize: function(device,negate) {
        this.device=device;
        this.negate=negate;
        this.state=false    
        this.process();
        },
        
    process : function() {
        this.state=this.negate ? (!this.device.getState()) :  this.device.getState();
        },   
        
    setMemory : function () {
        return { v: this.state };
        }
    });

//============================================================================

var plcOutputClass = Class.create({ 
    
    initialize: function(device,setAction,clrAction) {
        this.device=device;
        this.setAction=setAction;
        this.clrAction=clrAction;
        this.state=false;
        this.process();
        },
        
    process : function() {
        if (this.state)
            this.device[this.setAction]();
        else
            this.device[this.clrAction]();
        },
        
        
    setMemory : function() {
        return {    coil    : this.state, 
                    contact : this.state,
                    set v(state)    {this.coil=state;},
                    get v()         {return this.contact;}
                    }
        },
        
    getMemory : function(obj) {
        this.state=obj.coil;
        }
    });

//============================================================================

var plcTimerClass = Class.create({ 
    
    initialize: function(delay) {
        this.coil=false;
        this.oldCoil=false;
        this.contact=false;
        this.count=0;
        this.delay=delay;        
        this.process();
        },
        
    process : function() {
        var risingEdge=this.coil && (!this.oldCoil);
        this.oldCoil=this.coil;
        if ( risingEdge && (!this.contact) ) {
            this.count=this.delay;
            }
        else 
            if (this.coil) {
                if (this.count==0)
                    this.contact=true;
                else
                    this.count--;
                }
           else {
              this.count=0;
              this.contact=false;
              }
        },
    setMemory : function (){
            return {
                    coil    : this.coil,
                    contact : this.contact,
                    set v(state) {this.coil=state;},
                    get v()     {return this.contact;}
                   }
           },
           
    getMemory : function (obj) {
        this.coil=obj.coil;
        }
    });

//============================================================================

var plcIndicatorClass = Class.create({ 
    // location.x=314,location.y=35
    initialize: function(ctx,location,actors) {
        this.ctx=ctx;
        this.location=location;
        this.actors=actors;
        
        this.inLightCoords = [
            [0,0,8,4],
            [0,11,8,4],
            [0,22,8,4],
            [0,33,8,4],
            [22,0,8,4],
            [22,11,8,4],
            [22,22,8,4],
            [2,33,8,4],
            ];
            
        this.outLightCoords = [
            [102,0,8,4],
            [102,11,8,4],
            [102,22,8,4],
            [102,33,8,4],
            [124,0,8,4],
            [124,11,8,4],
            [124,22,8,4],
            [124,33,8,4],
            ];
            
        this.attrs = { 
                    strokeStyle : "#FF0000", 
                    lineWidth : 1, 
                    fillStyle : "#FF0000"
                    };
        },
        
        inputLightOff : function (index) {
            this.ctx.context.clearRect( this.location.x + this.inLightCoords[index][0]-1,
                                        this.location.y + this.inLightCoords[index][1]-1,
                                        this.inLightCoords[index][2]+2,
                                        this.inLightCoords[index][3]+2
                                      );
            },
        
        outputLightOff : function (index) {
            this.ctx.context.clearRect( this.location.x + this.outLightCoords[index][0]-1,
                                        this.location.y + this.outLightCoords[index][1]-1,
                                        this.outLightCoords[index][2]+2,
                                        this.outLightCoords[index][3]+2
                                      );
            },
        
        inputLightOn : function (index) {
                    this.ctx.rectangle( this.location.x + this.inLightCoords[index][0],
                                        this.location.y + this.inLightCoords[index][1],
                                        this.inLightCoords[index][2],
                                        this.inLightCoords[index][3],
                                        this.attrs
                                      );
            },
        outputLightOn : function (index) {
                    this.ctx.rectangle( this.location.x + this.outLightCoords[index][0],
                                        this.location.y + this.outLightCoords[index][1],
                                        this.outLightCoords[index][2],
                                        this.outLightCoords[index][3],
                                        this.attrs
                                      );
            } 
    });

//============================================================================

var plcClass = Class.create({ 
    // location.x=314,location.y=35
    initialize: function(ctx,location,actors) {
        this.actors=actors;
        this.indicators=new plcIndicatorClass(ctx,location,actors);
        this.running=false;
        this.inputs  = [null,null,null,null,null,null,null,null];
        this.outputs = [null,null,null,null,null,null,null,null];
        this.difus   = [null,null,null,null,null,null,null,null];
        this.difds   = [null,null,null,null,null,null,null,null];
        this.timers  = [null,null,null,null,null,null,null,null];
        this.cnts    = [null,null,null,null,null,null,null,null];
        this.sfts    = [null,null,null,null,null,null,null,null];
        this.declare = {};
        this.program="";
        },
    
    attachInput  : function(index,name,device,negate) {
        this.inputs[index]= new plcInputClass(device,negate);
        this.declare[name]={ alias : "IN"+index, props : ".v" };
        },
        
    attachOutput : function(index,name,device,setAction,clrAction) {
        this.outputs[index]= new plcOutputClass(device,setAction,clrAction);
        this.declare[name]={ alias : "OUT"+index, props : ".v" };
        },
        
    attachDifu : function(index,name) {
        this.difus[index]= new plcDIFUClass();
        this.declare[name]={ alias : "DIFU"+index, props : ".v" };
        },
    
    attachDifd : function(index,name) {
        this.difds[index]= new plcDIFDClass();
        this.declare[name]={ alias : "DIFD"+index, props : ".v" };
        },  
        
    attachTimer  : function(index,delay,name){
        this.timers[index]= new plcTimerClass(delay);
        this.declare[name]={ alias : "TIM"+index, props : ".v" };
        },
        
    attachCounter  : function(index,name,count){
        this.cnts[index]= new plcCNTClass(count);
        this.declare[name+"_R"]={ alias : "CNT"+index, props : ".r" };
        this.declare[name]={ alias : "CNT"+index, props : ".v" };
        },
        
    attachShiftRegister : function(index,name){
        this.sfts[index]= new plcSFTClass();
        this.declare[name+"_C"]={ alias : "SFT"+index, props : ".c" };
        this.declare[name+"_R"]={ alias : "SFT"+index, props : ".r" };
        this.declare[name+"_D"]={ alias : "SFT"+index, props : ".d" };
        for (var i=15; i>-1;i--)
            this.declare[name+'_'+i]= { alias : "SFT"+index, props : ".v"+i };
        },
        
    attach : function(declarations) {
        for (var elem in declarations) {
            switch (declarations[elem].type){
                case "IN" :
                    this.attachInput( declarations[elem].index, elem,
                                this.actors[declarations[elem].signal],
                                declarations[elem].negate );
                    break;
                case "OUT" :
                    this.attachOutput( declarations[elem].index, elem,
                                this.actors[declarations[elem].device],
                                declarations[elem].actionOn,
                                declarations[elem].actionOff );
                    break;
                case "DIFU" :
                    this.attachDifu( declarations[elem].index,elem);
                    break;
                case "DIFD" :
                    this.attachDifd( declarations[elem].index,elem);
                    break;
                case "TIM" :
                    this.attachTimer( declarations[elem].index,
                                      declarations[elem].delay, elem );
                    break;
                case "CNT" :
                    this.attachCounter( declarations[elem].index,elem,declarations[elem].value);
                    break;
                case "SFT" :
                    this.attachShiftRegister( declarations[elem].index,elem);
                    break;
                }
            }
        },
    
    sets : function(objs,elemType){
        if (objs==null)
            return;
        for (var i=0;i<8;i++){
            var element=elemType+i;
            this.memory[element]= (objs[i]!=null) ? objs[i].setMemory() : null;
            }
        },
        
    setMemory : function() {
        this.memory = {};
        this.sets(this.inputs,"IN");
        this.sets(this.outputs,"OUT");
        this.sets(this.timers,"TIM");
        this.sets(this.difus,"DIFU");
        this.sets(this.difds,"DIFD");
        this.sets(this.cnts,"CNT");
        this.sets(this.sfts,"SFT");
    
        for (var elem in this.declare) {
            if (this.memory[elem]==null)
                this.memory[elem]=this.memory[this.declare[elem]];
            }
        
        },
    
    gets : function (objs,elemType){
        if (objs==null)
            return;
        for (var i=0;i<8;i++){
            var element=elemType+i;
            if (objs[i]!=null)
                objs[i].getMemory(this.memory[element])
            }
        },
        
    getMemory : function() {
        this.gets(this.outputs,"OUT");
        this.gets(this.timers, "TIM");
        this.gets(this.difus,  "DIFU");
        this.gets(this.difds,  "DIFD");
        this.gets(this.cnts,   "CNT");
        this.gets(this.sfts,   "SFT");
        },
    
    
    
    process : function () {
        if (!this.running)
            return;
        for (var i=0;i<8;i++){
            if (this.inputs[i]!=null) {
                this.inputs[i].process();
                if (this.inputs[i].state)
                    this.indicators.inputLightOn(i);
                else
                    this.indicators.inputLightOff(i);
                }
            }
            
        for (var i=0;i<8;i++)
            if (this.timers[i]!=null)
                this.timers[i].process();
        
        for (var i=0;i<8;i++)
            if (this.difus[i]!=null)
                this.difus[i].process();
        
        for (var i=0;i<8;i++)
            if (this.difds[i]!=null)
                this.difds[i].process();
        
        for (var i=0;i<8;i++)
            if (this.cnts[i]!=null)
                this.cnts[i].process();
        
        for (var i=0;i<8;i++)
            if (this.sfts[i]!=null)
                this.sfts[i].process();
        
        this.setMemory();
        
        with (this.memory) {
            for (var i=0;i<this.program.length;i++) 
                eval(this.program[i]);
            }
            
        this.getMemory();
        
         for (var i=0;i<8;i++){
              if (this.outputs[i]!=null){
                this.outputs[i].process();
                    if (this.outputs[i].state)
                    this.indicators.outputLightOn(i);
                else
                    this.indicators.outputLightOff(i);
                }
            }
        },
        
        
     run : function()   { this.running=true; },
        
     stop : function () { this.running=false;},
     
     
     loadProgram : function (program) {
        this.program=[];
        for (var elem in program) {
            var s=elem + " = " + program[elem];
            s=s.replace(/\s*NOT\s+/g,' ! ');
            s=s.replace(/\s+AND\s+/g,' && ');
            s=s.replace(/\s+OR\s+/g,' || ');
            for (var decl in this.declare){
                var reg=new RegExp(decl,'g');
                s=s.replace(reg,this.declare[decl].alias+this.declare[decl].props);
                }
            this.program.push(s);
            console.log(s);
            }
        }      
    });