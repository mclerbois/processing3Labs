/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var _project = new projectContainerClass({
    
    title   : "Commande d'un wagonnet",
    auteur  : "M. Clerbois",
    
    images : {
        plant       : "./images/plant.png",
        wagon       : "./images/wagon.png",
        plc         : "./images/plc.png",
        startOn     : "./images/start_on.png",
        startOff    : "./images/start_off.png",
        ledOn       : "./images/ledOn.png",
        ledOff      : "./images/ledOff.png"
        },
    
    canvas : {    
        fixCanvas   : {id : "fixCanvas", width:"1024", height:"512", container : "container"},
        movCanvas   : {id : "movCanvas", width:"1024", height:"512", container : "container"}
        },
        
    scene : {    
        plantImage  : {  
                        type       : "canvasImageClass", 
                        canvas     : "fixCanvas", 
                        location   : { x:0  , y:0, l:1024, h:512 },  
                        image      : "plant",  
                        draw       : true 
                      },
                      
        plcImage    : { 
                        type : "canvasImageClass", 
                        canvas : "fixCanvas", 
                        location : {x:400, y:0, l:467 , h:341} ,  
                        image : "plc",    
                        draw : true 
                      }
        },
        
    actors            : {
        wagon        : {  
                          type : "horizontalMovingImageClass", 
                          canvas : "movCanvas", 
                          location : {x: 25, y:363, l:196, h:111},
                          image:"wagon",
                          leftSpeed  : 2,
                          rightSpeed : 1,
                          limits     : { x1 : 0, y1 : 363, x2 : 820, y2:363},
                          draw : true 
                       },
        startButton  : {  
                          type      : "pushButtonImageClass", 
                          canvas    : "movCanvas", 
                          location  : {x:100, y:50, l:157, h:180}, 
                          onImage   : "startOn", 
                          offImage  : "startOff", 
                          cible     : {x1:100, y1:50, x2:257, y2:230},
                          draw:true 
                       },
        leftBarrier  : {  
                          type      : "sensorClass" , 
                          cible     : { x1:0, y1:363, x2:30, y2:363 }, 
                          obstacle  : "wagon"
                       },
        rightBarrier : {  
                          type      : "sensorClass" , 
                          cible     : { x1:820, y1:363, x2:870, y2:363 },  
                          obstacle  : "wagon"
                        },
        leftBarrierIndicator  : {  
                          type      : "twoStateImageIndicatorClass", 
                          canvas    : "movCanvas", 
                          location  : {x:46, y:126, l:9, h:9}, 
                          onImage   : "ledOn", 
                          offImage  : "ledOff", 
                          draw:true 
                       },
        rightBarrierIndicator : {  
                          type      : "twoStateImageIndicatorClass", 
                          canvas    : "movCanvas", 
                          location  : {x:950, y:126, l:9, h:9}, 
                          onImage   : "ledOn", 
                          offImage  : "ledOff", 
                          draw:true 
                        }
        },
    links : [
        { signal : "leftBarrier",  target : "leftBarrierIndicator",  onAction : "on", offAction : "off"},
        { signal : "rightBarrier", target : "rightBarrierIndicator", onAction : "on", offAction : "off"}
        ],
    plc : {  canvas : "movCanvas" , location : {x:714, y:35, l:467 , h:341}},
    clock : { delay:10, processList: ["wagon", "leftBarrier", "rightBarrier"]}
    
    });

var _declare ={
    LS1  : { type : "IN", index : 0 , signal : "leftBarrier",  negate : false },
    LS2  : { type : "IN", index : 1 , signal : "rightBarrier", negate : false },
    START: { type : "IN", index : 2 , signal : "startButton",  negate : false },

    MOTOR_RIGHT  : { type : "OUT", index : 0, signal : "MOTOR_RIGHT", 
     device : "wagon", actionOn : "rightMotorOn", actionOff : "rightMotorOff" },

    MOTOR_LEFT : { type : "OUT", index : 1, signal : "MOTOR_LEFT",
        device      : "wagon",
        actionOn    : "leftMotorOn",  
        actionOff   : "leftMotorOff"
        },

    TIM0    : { type : "TIM", index : 0, delay : 500 },
    PLHa    : { type : "DIFU", index : 0 },
    PLHb    : { type : "DIFU", index : 1 },
    PHLa    : { type : "DIFD", index : 0 },
    COUNT   : { type : "CNT",  index : 0, value : 2}, //COUNT_R reset counter
    SFT     : { type : "SFT",  index : 0 } // data SFT_D, clock SFT0_C, reset SFT0_R
    };

var _program = {
    
    MOTOR_RIGHT : "((START AND LS1) OR MOTOR_RIGHT) AND NOT LS2",
    TIM0        : "LS2",
    MOTOR_LEFT  : "( TIM0 OR MOTOR_LEFT ) AND (NOT LS1)"
    
    /*PLHa        : "START",
    PLHb        : "LS2",
    //COUNT       : "PLHa",
    //TIM0        : "COUNT",
    //COUNT_R     : "TIM0",
    //MOTOR_RIGHT : "COUNT"
    SFT_D        : "LS1",
    SFT_C        : "PLHa",
    SFT_R        : "PLHb",
    MOTOR_RIGHT  : "SFT_4",
    SFT_2        : "START"*/
    };
    