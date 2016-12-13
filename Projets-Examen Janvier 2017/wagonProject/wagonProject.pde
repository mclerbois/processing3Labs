/******************************************************************************************************************
*
*
*******************************************************************************************************************/

final int samplingTime=10;

PlantBackground plant;
PlantBackground ladder;

Wagon wagon;
HorizontalPositionSensor leftSensor,rightSensor;
PushButton startButton;
Plc  plc;

void setup(){
  size(1024,512);
  plant= new PlantBackground("images\\plant.png",0,0);
  ladder= new PlantBackground("images\\ladder.PNG",400,95);
  
  wagon= new Wagon("images\\wagon.png",25,363);
  
  leftSensor=new HorizontalPositionSensor(new String[] {"images\\ledOff.png","images\\ledOn.png"},46,126);
  leftSensor.attatch(wagon);
  
  rightSensor=new HorizontalPositionSensor(new String[] {"images\\ledOff.png","images\\ledOn.png"},950,126);
  rightSensor.attatch(wagon);
  
  startButton=new PushButton(new String[] {"images\\start_off.png","images\\start_on.png"},100,50);
  
  plc=new Plc("images\\plc.png",400,0);

  new Thread (wagon).start();
  new Thread (leftSensor).start();
  new Thread (rightSensor).start();
  
}

// simulation du bornier de connexion
void  actorsToPlc(boolean inputs[]){
    inputs[0]=startButton.state;
    inputs[1]=leftSensor.state;
    inputs[2]=rightSensor.state;
}

// simulation du bornier de connexion
void   plcToActors(boolean outputs[]){
    wagon.left=outputs[0];
    wagon.right=outputs[1];
}


void draw(){
   plc.run();

   background(200);
   plant.draw();
   plc.draw();
   ladder.draw();

   leftSensor.draw();
   rightSensor.draw();
   startButton.draw();
   wagon.draw();
}

void mouseClicked(){
}

void mousePressed(){
  startButton.mousePressed();
}

void mouseReleased(){
  startButton.mouseReleased();
}