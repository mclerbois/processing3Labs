/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var _project = new projectContainerClass({
    
    title   : "",
    auteur  : "",

    images : {
        plant       : "./images/plant.png",
        plc         : "./images/plc.png",
        startOn     : "./images/start_on.png",
        startOff    : "./images/start_off.png",
        stopOn      : "./images/stop_on.png",
        stopOff     : "./images/stop_off.png",
        resetOn     : "./images/reset_on.png",
        resetOff    : "./images/reset_off.png",
        endOn       : "./images/end_on.png",
        endOff      : "./images/end_off.png",
        ledOn       : "./images/led_on.png",
        ledOff      : "./images/led_off.png",
        openValve   : "./images/openValve.png",
        closeValve  : "./images/closeValve.png"
        },
        
    canvas : {    
        fixCanvas   : {
            id : "fixCanvas", 
            width:"1024", height:"512", 
            container : "container"
            },
        movCanvas   : {
           id : "movCanvas", 
           width:"1024", height:"512", 
           container : "container"
           }
        },
        
    scene : {    
        plantImage  : {  
            type : "canvasImageClass", canvas : "fixCanvas", 
            location   : {x:0  , y:0, l:1024, h:512},  
            image : "plant"
            },
        
        plcImage    : {  
            type : "canvasImageClass", canvas : "fixCanvas", 
            location   : {x:500, y:0, l:467 , h:341},  
            image : "plc"
            }       
        },
        
    actors            : {       
        startButton  : {  
            type       : "pushButtonImageClass", canvas : "movCanvas", 
            location   : {x:400, y:20, l:67, h:85}, 
            onImage    : "startOn", offImage   : "startOff"
            },
        stopButton     : {  
            type       : "pushButtonImageClass", canvas : "movCanvas", 
            location   : {x:400, y:120, l:67, h:85}, 
            onImage    : "stopOn", offImage   : "stopOff"
            },
        resetButton     : {  
            type       : "pushButtonImageClass", canvas  : "movCanvas", 
            location   : {x:400, y:220, l:67, h:85}, 
            onImage    : "resetOn", offImage   : "resetOff"
            },
        endLight     : {  
            type       : "twoStateImageIndicatorClass", canvas : "movCanvas", 
            location   : {x:400, y:320, l:67, h:85}, 
            onImage    : "endOn", offImage   : "endOff"
            },
        upperLevelIndicator : {  
            type       : "twoStateImageIndicatorClass", canvas : "movCanvas", 
            location   : {x:7, y:145, l:9, h:9}, 
            onImage    : "ledOn", offImage   : "ledOff"
            },
        lowerLevelIndicator : {  
            type       : "twoStateImageIndicatorClass", canvas : "movCanvas", 
            location   : {x:7, y:253, l:9, h:9}, 
            onImage    : "ledOn", offImage   : "ledOff"
            },
       motorIndicator : {  
            type       : "twoStateImageIndicatorClass", canvas  : "movCanvas", 
            location   : {x:147, y:380, l:9, h:9}, 
            onImage    : "ledOn", offImage   : "ledOff"
            },
        upperValve : {  
            type       : "valveSimulatorClass", canvas     : "movCanvas", 
            location   : {x:282, y:0, l:38, h:43}, 
            onImage    : "openValve", offImage   : "closeValve",
            flow       : 3200
            },
        lowerValve : {  
            type       : "valveSimulatorClass", canvas     : "movCanvas", 
            location   : {x:282, y:323, l:38, h:43}, 
            onImage    : "openValve", offImage   : "closeValve",
            flow       : -9000
            },
        tank : {  
            type       : "tankSimulatorClass", 
            inFlow     : "upperValve", outFlow : "lowerValve"
            },
        levelIndicator : {  
            type       : "levelIndicatorClass", canvas     : "movCanvas", 
            location   : {x:305, y:252, l:3, h:123}, 
            target     : "tank",  
            lowLevel   : 75, highLevel : 250
            },
        lowLevelSensor : {  
            type       : "levelSwitchClass", 
            target     : "tank",  
            lowLevel   : 70, highLevel  : 75
            },
        highLevelSensor : {  
            type       : "levelSwitchClass", 
            target     : "tank",  
            lowLevel   : 225, highLevel  : 230
            },
        buzzer : {  
            type       : "soundClass", 
            soundFile  : "./sounds/buzzer2.wav",
            id         : "dummy1"
            },
        motor_sound : {  
            type       : "soundClass", 
            soundFile  : "./sounds/motor_sound.wav",
            id         : "dummy2"
            }
        },
    links : [
        { signal : "lowLevelSensor",  target : "lowerLevelIndicator",  
            onAction : "on", offAction : "off"},
        {  signal : "highLevelSensor",  target : "upperLevelIndicator",  
            onAction : "on", offAction : "off"},
         {  signal : "motorIndicator",  target : "motor_sound",  
            onAction : "on", offAction : "off"},
        
        ],
    plc    : {  
        canvas : "movCanvas" , 
        location : {x:814, y: 35, l: 467, h:341}
        },
    clock  : {  
        delay:10, 
        processList : [ "tank","levelIndicator","lowLevelSensor",
                        "highLevelSensor","buzzer","motor_sound" ]
        }
    });

var _declare ={
    PB1   : { type : "IN",  index : 0, signal : "startButton" },
    PB2   : { type : "IN",  index : 1, signal : "stopButton" },
    PB3   : { type : "IN",  index : 2, signal : "resetButton" },
    TLB1  : { type : "IN",  index : 5, signal : "highLevelSensor" },
    TLB2  : { type : "IN",  index : 6, signal : "lowLevelSensor" },
    MV1   : { type : "OUT", index : 0, device : "upperValve", actionOn : "open", 
                    actionOff : "close" },
    MV2   : { type : "OUT", index : 1, device : "lowerValve", actionOn : "open", 
                    actionOff : "close" },
    MOTOR : { type : "OUT", index : 2, device : "motorIndicator", actionOn : "on", 
                    actionOff : "off" },
    PL  : {  type : "OUT", index : 4, device : "endLight", actionOn : "on",
                    actionOff : "off" },
    BZ  : {  type : "OUT", index : 5, device : "buzzer", actionOn : "on", 
                    actionOff : "off" },
    ReachTlb1  : { type : "DIFU", index : 0 },            
    Reach      : { type : "MEMO", index : 0 },  
    Mv2closes  : { type : "DIFD", index : 0 },
    PassTLBb2  : { type : "DIFD", index : 0 },
    CNT47      : { type : "CNT",  index : 0, value : 4},
    TIM0       : { type : "TIM",  index : 0, delay : 200 }
    };

var _program = {
    MV1             : "( PB1 OR MV1 OR Mv2closes) AND ( NOT BZ) AND ( NOT PL ) AND ( NOT Reach) AND ( NOT PB2)",
    MOTOR           : "MV1",
    ReachTlb1       : "TLB1",
    Reach           : "TLB2 AND ReachTlb1",
    MV2             : "(( MV1 AND TLB1  ) OR MV2 ) AND TLB2",
    Mv2closes       : "MV2",
    PassTLBb2       : "TLB2",
    CNT47           : "PassTLBb2",
    CNT47_R         : "PB3",
    PL              : "CNT47",
    TIM0            : "PL",
    BZ              : "CNT47 AND NOT TIM0"
    };