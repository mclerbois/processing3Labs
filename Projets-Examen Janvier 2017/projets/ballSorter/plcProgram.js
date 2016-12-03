/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// Compléter la structure de données ci-dessous.

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
        trap        : "./images/trap.png",
        pusher      : "./images/pusher.png",
        bball       : "./images/bball.png",
        wball       : "./images/wball.png"
        },
        
    canvas : {    
        fixCanvas   : {
            id : "fixCanvas", width:"1400", height:"600", 
            container : "container"
            },
            
        movCanvas   : { 
            id : "movCanvas", width:"1400", height:"600", 
            container : "container"
            },
            
        movCanvas1   : { 
            id : "movCanvas1", width:"800", height:"600", 
            container : "container"
            }
        },
        
    scene : {    
        plantImage  : {  
            type : "canvasImageClass", 
            canvas : "fixCanvas", location : {x:0  , y:0, l:1024, h:600},  
            image : "plant"
            },

        plcImage    : {  
            type : "canvasImageClass", 
            canvas : "fixCanvas", location : {x:800, y:0, l:467 , h:341},  
            image : "plc"
            }
        },
        
    actors            : {

      startButton  : {  
            type : "pushButtonImageClass", 
            canvas : "movCanvas", location : {x:900, y:470, l:67, h:85}, 
            onImage   : "startOn", offImage  : "startOff"
            },
      stopButton  : {  
            type : "pushButtonImageClass", 
            canvas : "movCanvas", location : {x:1000, y:470, l:67, h:85}, 
            onImage   : "stopOn", offImage  : "stopOff"
            },
     topCylinder  : {  
            type      : "horizontalPneumaticMovingImageClass", canvas : "movCanvas", 
            location  : {x: 289, y:43, l:131, h:38},
            direction : 1, image     : "trap",
            leftSpeed : 8, rightSpeed : 1,
            limits    : { x1 : 289, y1 : 43, x2 : 344, y2:43} 
            },
     bottomCylinder  : {  
            type      : "horizontalPneumaticMovingImageClass", canvas : "movCanvas", 
            location  : {x: 289, y:102, l:131, h:38},
            direction : 1, image     : "trap",
            leftSpeed : 8, rightSpeed : 1,
            limits    : { x1 : 289, y1 : 102, x2 : 344, y2:102} 
            },
     pusher  : {  
            type      : "horizontalPneumaticMovingImageClass", canvas : "movCanvas", 
            location  : {x: 520, y:217, l:208, h:47},
            direction : -1, image     : "pusher",
            leftSpeed : 8, rightSpeed : 1,
            limits    : { x1 : 425, y1 : 217, x2 : 520, y2:217} 
            },
    ball     : {  
            type      : "twoStateImageIndicatorClass", 
            canvas    : "movCanvas1", location  : {x:443, y:30, l:26, h:26}, 
            onImage   : "wball", 
            offImage  : "bball",
            locations : [
                [{x:443, y:30},{x:443, y:90},{x:443, y:200} ,{x:319, y:326}, 
                    {x:276, y:358},{x:222, y:398},{x:177, y:473},
                    {x:112, y:520}],
        
                [{x:443, y:30},{x:443, y:90},{x:443, y:200} ,{x:462, y:326}, 
                    {x:487, y:363},{x:515, y:409},{x:542, y:474},
                    {x:613, y:511}]

                ]
         },
    s1  : {  
            type      : "sensorClass" , 
            cible     : { x1: 440, y1:30, x2:450, y2:50 }, 
            obstacle  : "ball"
            },
    s2  : {  
            type      : "colorSensorClass" , 
            cible     : { x1: 430, y1:81, x2:474, y2:117 }, 
            obstacle  : "ball"
            },
    s3  : {  
            type      : "sensorClass" , 
            cible     : { x1: 103, y1:500, x2:300, y2:547 }, 
            obstacle  : "ball"
            },
    s4  : {  
            type      : "sensorClass" , 
            cible     : { x1: 403, y1:500, x2:639, y2:547 }, 
            obstacle  : "ball"
            }
        },
        
    links : [{ signal : "s1",  target : "ball",  
            onAction : "toggle", offAction : "nop"},],
    
    plc   : {  
        canvas : "movCanvas" , 
        location : {x:1114, y: 35, l: 467, h:341}
        },
        
    clock : {  delay:10 , processList : ["topCylinder","bottomCylinder",
                                         "pusher","s1","s2","s3","s4"]}
    });

var _declare ={

        START       : { type : "IN", index : 0, signal : "startButton" },
        STOP        : { type : "IN", index : 1, signal : "stopButton" },
        S1          : { type : "IN", index : 2, signal : "s1" },
        S2          : { type : "IN", index : 3, signal : "s2" },
        TOPCYLINDER : { type : "OUT", index : 0, device : "topCylinder", actionOn : "releasePressure", 
                        actionOff : "applyPressure" },
        BOTTOMCYLINDER : { type : "OUT", index : 1, device : "bottomCylinder", actionOn : "releasePressure", 
                        actionOff : "applyPressure" },
        PUSHER : { type : "OUT", index : 2, device : "pusher", actionOn : "applyPressure", 
                        actionOff : "releasePressure" },
        MEMO0    : { type : "MEMO", index : 0 },
        MEMO1    : { type : "MEMO", index : 1 },
        TIM0     : { type : "TIM", index : 0, delay : 150},
        TIM1     : { type : "TIM", index : 1, delay : 50},
        TIM2     : { type : "TIM", index : 2, delay : 50},
        TIM3     : { type : "TIM", index : 3, delay : 100},
        TIM4     : { type : "TIM", index : 4, delay : 50},
        
        MOVEBALL : { type : "OUT", index : 7, device : "ball", actionOn : "jump", 
                        actionOff : "stay" },
        DIFU0     : { type : "DIFU" , index :0},
        DIFU1     : { type : "DIFU" , index :1},
        
        MEMO2     : { type : "MEMO", index : 2 },
        
        S3        : { type : "IN", index : 4, signal : "s3" },
        S4        : { type : "IN", index : 5, signal : "s4" }
        };
    
var _program = {
    MEMO0 : " (START OR MEMO0) AND NOT STOP",
    TOPCYLINDER : " ((MEMO0 AND S1) OR TOPCYLINDER) AND NOT MEMO1",
    TIM0 : "TOPCYLINDER",
    MEMO1 : "(TIM0 OR MEMO1) AND NOT TIM4",
    TIM1 : "MEMO1 AND S2",
    TIM2 : "MEMO1 AND NOT S2",
    BOTTOMCYLINDER : "TIM1 OR TIM3",
    TIM4 : "BOTTOMCYLINDER",
    PUSHER : "TIM2",
    TIM3   : "TIM2",
    
    DIFU0 : "TOPCYLINDER",
    DIFU1 : "BOTTOMCYLINDER",
    MEMO2 : "(DIFU1 OR MEMO2 ) AND ( NOT S3) AND ( NOT S4)",
    MOVEBALL : "DIFU0 OR DIFU1 OR (MEMO2 AND CLK) OR (S3 AND CLK) OR (S4 AND CLK)"
    };