/******************************************************************************************************************
*
*
*******************************************************************************************************************/

final int samplingTime=10;

PlantBackground plant;

Indicator upperValve,lowerValve,endLight,mixerIndicator;

PushButton startButton;
PushButton stopButton;
PushButton resetButton;

Tank tank;
LevelPositionSensor upperLevel,lowerLevel;

Plc  plc;

void setup(){
  size(1024,512);
  plant= new PlantBackground("images\\plant.png",0,0);
  
  upperValve=new Indicator(new String[] {"images\\closeValve.png","images\\openValve.png"},282,0);
  lowerValve=new Indicator(new String[] {"images\\closeValve.png","images\\openValve.png"},282,323);
  endLight=new Indicator(new String[] {"images\\end_on.png","images\\end_off.png"},400,320);
  mixerIndicator=new Indicator(new String[] {"images\\ledOff.png","images\\ledOn.png"},147,380);
  
  tank=new Tank(null,305,252);
  tank.attatch(upperValve,lowerValve);
  
  
  upperLevel=new LevelPositionSensor(new String[] {"images\\ledOff.png","images\\ledOn.png"},7,145,110);
  upperLevel.attatch(tank);
  
  lowerLevel=new LevelPositionSensor(new String[] {"images\\ledOff.png","images\\ledOn.png"},7,253,10);
  lowerLevel.attatch(tank);
  
  startButton=new PushButton(new String[] {"images\\start_off.png","images\\start_on.png"},400,20);
  stopButton=new PushButton(new String[] {"images\\stop_off.png","images\\stop_on.png"},400,120);
  resetButton=new PushButton(new String[] {"images\\reset_off.png","images\\reset_on.png"},400,220);

  plc=new Plc("images\\plc.png",500,0);

 new Thread (tank).start(); 
 new Thread (upperLevel).start();
 new Thread (lowerLevel).start();
}



//***************************************************************************
// simulation du bornier de connexion
void  actorsToPlc(boolean inputs[]){
   inputs[0]=startButton.state;
   
}

// simulation du bornier de connexion
void   plcToActors(boolean outputs[]){
  upperValve.state=outputs[0];
  lowerValve.state=outputs[1];
}


void draw(){
   plc.run();

   background(200);
   plant.draw();
   plc.draw();
   
   startButton.draw();
   stopButton.draw();
   resetButton.draw();
   endLight.draw();
   mixerIndicator.draw();
   
   tank.draw();
   upperLevel.draw();
   lowerLevel.draw();
   
   upperValve.draw();
   lowerValve.draw();
   
}

void mouseClicked(){
}

void mousePressed(){
  startButton.mousePressed();
  stopButton.mousePressed();
  resetButton.mousePressed();
}

void mouseReleased(){
  startButton.mouseReleased();
  stopButton.mouseReleased();
  resetButton.mouseReleased();
}