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
        returnOn    : "./images/return_on.png",
        returnOff   : "./images/return_off.png",
        hookTop     : "./images/hookTop.png",
        hookBottom  : "./images/hookBottom.png",
        dirtyBox    : "./images/dirtyBox.png",
        cleanBox    : "./images/cleanBox.png",
        ledOn       : "./images/led_on.png",
        ledOff      : "./images/led_off.png",
        box         : "./images/box.png"
        },
        
    canvas : {    
        fixCanvas   : {
            id : "fixCanvas", width:"1400", height:"800", 
            container : "container" },
        movCanvas   : {
            id : "movCanvas", width:"1400", height:"800", 
            container : "container" },
        movCanvas1   : {
            id : "movCanvas1", width:"1000", height:"800", 
            container : "container" },
        movCanvas2   : {
            id : "movCanvas2", width:"1000", height:"800", 
            container : "container" }
        },
        
    scene : {    
        plantImage  : {  
            type : "canvasImageClass",  canvas : "fixCanvas", 
            location : {x:0  , y:0, l:1052, h:634},  
            image : "plant"
            },
        plcImage    : {  
            type : "canvasImageClass", 
            canvas : "fixCanvas", 
            location : {x:1100, y:0, l:467 , h:341},  
            image : "plc"
            },
       box    : {  
            type : "canvasImageClass", 
            canvas : "movCanvas2", 
            location : {x:0  , y:0, l:1052, h:634},
            image : "box"
            }
        
        },
        
    actors            : {
        startButton  : {  
            type : "pushButtonImageClass", canvas : "movCanvas", 
            location : {x:1100, y:370, l:67, h:85}, 
            onImage   : "startOn", offImage  : "startOff"
            },
        stopButton     : {  
            type       : "memoButtonImageClass", canvas : "movCanvas", 
            location   : {x:1200, y:370, l:67, h:85}, 
            onImage    : "stopOn", offImage   : "stopOff"
            },
        resetButton     : {  
            type       : "pushButtonImageClass", canvas  : "movCanvas", 
            location   : {x:1300, y:370, l:67, h:85}, 
            onImage    : "resetOn", offImage   : "resetOff",
            draw : false
            },
        returnButton     : {  
            type       : "pushButtonImageClass", canvas  : "movCanvas", 
            location   : {x:1100, y:500, l:67, h:85}, 
            onImage    : "returnOn", offImage   : "returnOff"
            },
        hookTop  : {  
            type      : "horizontalMovingImageClass", canvas : "movCanvas", 
            location  : {x: 900, y:100, l:48, h:32},
            image     : "hookTop",
            leftSpeed : 1, rightSpeed : 1,
            limits    : { x1 : 75, y1 : 100, x2 : 900, y2:100} 
            },
        hookBottom   : {  
            type      : "movingImageClass", canvas : "movCanvas", 
            location  : {x: 900, y:380, l:53, h:139},
            image     : "hookBottom",
            leftSpeed : 1, rightSpeed : 1,upSpeed : 1, downSpeed : 1,
            limits    : { x1 : 74, y1 : 133, x2 : 900, y2:380}
            },
        rope : {
            type : "ropeClass", canvas : "movCanvas",
            location  : {x: 75, y:133, l:0, h:0},
            objA : "hookTop",    offsetA : {x : 24, y : 32},
            objB : "hookBottom", offsetB : {x : 24, y : 0}
            },
        
        dirtyBox   : {  
            type      : "movingImageClass", canvas : "movCanvas", 
            location  : {x: 900, y:520, l:65, h:65},
            image     : "dirtyBox",
            leftSpeed : 1, rightSpeed : 1,upSpeed : 1, downSpeed : 1,
            limits    : { x1 : 74, y1 : 274, x2 : 900, y2:520}
            },
        cleanBox   : {  
            type      : "movingImageClass", canvas : "movCanvas1", 
            location  : {x: 900, y:520, l:65, h:65},
            image     : "cleanBox",
            leftSpeed : 1, rightSpeed : 1,upSpeed : 1, downSpeed : 1,
            limits    : { x1 : 74, y1 : 274, x2 : 900, y2:520},
            draw      : false
            },
        s5  : {  
            type      : "sensorClass" , 
            cible     : { x1: 74, y1:99, x2:76, y2:101 }, 
            obstacle  : "hookTop"
            },
        s4  : {  
            type      : "sensorClass" , 
            cible     : { x1: 492, y1:99, x2:494, y2:101 }, 
            obstacle  : "hookTop"
            },
        s1  : {  
            type      : "sensorClass" , 
            cible     : { x1: 900, y1:99, x2:902, y2:101 }, 
            obstacle  : "hookTop"
            },
        s3  : {  
            type      : "sensorClass" , 
            cible     : { x1: 74, y1:132, x2:902, y2:134 }, 
            obstacle  : "hookBottom"
            },
        s3Indicator : {  
            type       : "twoStateImageIndicatorClass", canvas : "movCanvas", 
            location   : {x:985, y:157, l:9, h:9}, 
            onImage    : "ledOn", offImage   : "ledOff"
            },
        s2  : {  
            type      : "sensorClass" , 
            cible     : { x1: 74, y1:379, x2:902, y2:381 }, 
            obstacle  : "hookBottom"
            },
        s2Indicator : {  
            type       : "twoStateImageIndicatorClass", canvas : "movCanvas", 
            location   : {x:985, y:393, l:9, h:9}, 
            onImage    : "ledOn", offImage   : "ledOff"
            },
        buzzer : {  
            type       : "soundClass", 
            soundFile  : "./sounds/buzzer2.wav",
            id         : "dummy1"
            }
        
        },
    links : [
        { signal : "hookTop",  target : "hookBottom",  
            onAction : "setMotors", offAction : "setMotors"},
        { signal : "hookBottom",  target : "dirtyBox",  
            onAction : "setMotors", offAction : "setMotors"},
        { signal : "hookBottom",  target : "cleanBox",  
            onAction : "setMotors", offAction : "setMotors"},
        { signal : "s2",  target : "s2Indicator",  
            onAction : "on", offAction : "off"},
        { signal : "s3",  target : "s3Indicator",  
            onAction : "on", offAction : "off"}
        ],
    plc   : {  
            canvas : "movCanvas" , 
            location : {x:1142, y: 35, l: 467, h:341}
            },
    clock : {  delay:10, processList : ["hookTop","hookBottom","dirtyBox","cleanBox", "rope",
        "s5","s4","s1","s3","s2","buzzer"]}
    });

var _declare ={
    PB1      : { type : "IN", index : 0 , signal : "startButton"},
    STOP     : { type : "IN", index : 1 , signal : "stopButton"},
    RST      : { type : "IN", index : 2 , signal : "resetButton"},
    PB2      : { type : "IN", index : 3 , signal : "returnButton"},
    S5       : { type : "IN", index : 4 , signal : "s5"},
    S4       : { type : "IN", index : 5 , signal : "s4"},
    S1       : { type : "IN", index : 6 , signal : "s1"},
    S3       : { type : "IN", index : 7 , signal : "s3"},
    S2       : { type : "IN", index : 8 , signal : "s2"},
    LEFTMOTOR : { type : "OUT", index : 0, device : "hookTop", actionOn : "leftMotorOn", 
                    actionOff : "leftMotorOff" },
    FWDMOTOR: { type : "OUT", index : 1, device : "hookTop", actionOn : "rightMotorOn", 
                    actionOff : "rightMotorOff" },
    UPMOTOR  : { type : "OUT", index : 2, device : "hookBottom", actionOn : "upMotorOn", 
                    actionOff : "upMotorOff" },
    DOWNMOTOR : { type : "OUT", index : 3, device : "hookBottom", actionOn : "downMotorOn", 
                    actionOff : "downMotorOff" },
    BZ  : {  type : "OUT", index : 4, device : "buzzer", actionOn : "on", 
                    actionOff : "off" },
    HIDEDIRTY  : {  type : "OUT", index : 5, device : "dirtyBox", actionOn : "hide", 
                    actionOff : "show" },
    HIDECLEAN  : {  type : "OUT", index : 6, device : "cleanBox", actionOn : "show", 
                    actionOff : "hide" },
    DIFU0    : { type : "DIFU", index : 0 },
    SFT      : { type : "SFT",  index : 0 },
    MEMO0    : { type : "MEMO", index : 0 },
    TIM0     : { type : "TIM",  index : 0, delay : 500 }
    };

var _program = {

    DIFU0   : "PB1 AND S2 AND S1",
    SFT_0   : "SFT_0 OR DIFU0",
    SFT_D   : "NO",
    SFT_C   : "MEMO0",
    SFT_R   : "SFT_9 OR RST",
    MEMO0   : "NOT MEMO0 AND ( "+
              "(SFT_0 AND S1 AND S3) OR "+
              "(SFT_1 AND S4) OR "+
              "(SFT_2 AND S2 AND TIM0) OR "+
              "(SFT_3 AND S3) OR "+
              "(SFT_4 AND S5) OR "+
              "(SFT_5 AND S2 AND PB2) OR "+
              "(SFT_6 AND S3) OR "+
              "(SFT_7 AND S1) OR "+
              "(SFT_8 AND S2))",
    IL      : "NOT STOP",
    UPMOTOR : "SFT_0 OR SFT_3 OR SFT_6",
    LEFTMOTOR : "SFT_1 OR SFT_4",
    DOWNMOTOR : "SFT_2 OR SFT_5 OR SFT_8",
    TIM0     :  "SFT_2",
    BZ       : "SFT_5 AND S2",
    FWDMOTOR: "SFT_7",
    
    HIDEDIRTY : "SFT_3  OR SFT_4 OR SFT_5 OR SFT_6 OR SFT_7 OR SFT_8",
    HIDECLEAN : "SFT_3  OR SFT_4 OR SFT_5",
    
    ILC     : "YES"
    
    };