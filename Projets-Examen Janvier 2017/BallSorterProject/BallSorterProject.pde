/******************************************************************************************************************
 *
 *
 *******************************************************************************************************************/

final int samplingTime=10;  // temps d'échantillonnage

PlantBackground plant;      

VerticalPositionSensor       upperSensor;
VerticalColorPositionSensor  colorSensor;

PushButton startButton;
PushButton stopButton;


Trap  upperTrap,lowerTrap;
Pusher  pusher;


Plc  plc;
Ball  aBall;


void setup() {
  size(1400, 600);
  plant= new PlantBackground("images\\plant.png", 0, 0);

  startButton=new PushButton(new String[] {"images\\start_off.png", "images\\start_on.png"}, 1100, 370);
  stopButton=new PushButton(new String[] {"images\\stop_off.png", "images\\stop_on.png"}, 1200, 370);

  upperTrap=new Trap("images\\trap.png", 289, 43);
  lowerTrap=new Trap("images\\trap.png", 289, 102);
  
  pusher=new Pusher("images\\pusher.png", 520, 217);
  
  aBall=new Ball(new String[] {"images\\bball.png", "images\\wball.png"}, 443, 30);

  upperSensor=new VerticalPositionSensor(new String[] {"images\\ledOff.png", "images\\ledOn.png"}, 487, 41, 30,50);
  upperSensor.attatch(aBall);
  
  colorSensor=new VerticalColorPositionSensor(new String[] {"images\\ledOff.png", "images\\ledOn.png"}, 487, 105, 94,114);
  colorSensor.attatch(aBall);
  
  
  plc=new Plc("images\\plc.png", 800, 0);
  upperTrap.airFlow=true;
  lowerTrap.airFlow=true;
  
  new Thread (upperTrap).start(); 
  new Thread (lowerTrap).start(); 
  new Thread (pusher).start(); 
  
  new Thread (upperSensor).start();
  new Thread (aBall).start();
  new Thread (colorSensor).start();
  
}



//***************************************************************************
// simulation du bornier de connexion
void  actorsToPlc(boolean inputs[]) {
  inputs[0]=startButton.state;
  inputs[1]=stopButton.state;
  
  inputs[2]=(aBall.value==0);
  inputs[3]=
  
  
  aBall.upper=upperTrap.state;
  aBall.lower=lowerTrap.state;
  aBall.pusher=pusher.state;
  
  inputs[7]=upperTrap.state;
}

// simulation du bornier de connexion
void   plcToActors(boolean outputs[]) {
  
  upperTrap.airFlow=outputs[0];
  lowerTrap.airFlow=outputs[1];
  pusher.airFlow=outputs[2];
}


void draw() {
  plc.run();

  background(200);
  plant.draw();
  plc.draw();

  startButton.draw();
  stopButton.draw();
  
  upperTrap.draw();
  lowerTrap.draw();
  pusher.draw();
  aBall.draw();
  upperSensor.draw();
  colorSensor.draw();

}

void mouseClicked() {
}

void mousePressed() {
  startButton.mousePressed();
  stopButton.mousePressed();
//  resetButton.mousePressed();
//  returnButton.mousePressed();
}

void mouseReleased() {
  startButton.mouseReleased();
  stopButton.mouseReleased();
//  resetButton.mouseReleased();
//  returnButton.mouseReleased();
}