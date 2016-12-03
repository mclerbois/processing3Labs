/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function scheduler(delay){
    this.delay=delay;
    this.processList=[];
            
    this.process = function (processList) {
        for (var i=0;i<processList.length;i++)
            processList[i].process();
        }
        
    this.attachProcess=function (process) {
        this.processList.push(process);
        };
  
    this.run = function() {
        this.clock=window.setInterval(this.process,this.delay,this.processList);
        }
        
    this.stop = function(){
        window.clearInterval(this.clock)
        }
    }

