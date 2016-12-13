/******************************************************************************************************************
 *
 *
 *******************************************************************************************************************/

final int samplingTime=10;

PlantBackground plant;

HorizontalPositionSensor leftSensor, middleSensor, rightSensor;
VerticalPositionSensor upSensor, downSensor;

PushButton startButton;
PushButton stopButton;
PushButton resetButton;
PushButton returnButton;
Wagon      wagon;
Hook       hook;

Box  dirtyBox,cleanBox;

Plc  plc;

void setup() {
  size(1400, 800);
  plant= new PlantBackground("images\\plant.png", 0, 0);

  //  endLight=new Indicator(new String[] {"images\\end_on.png","images\\end_off.png"},400,320);
  //  mixerIndicator=new Indicator(new String[] {"images\\ledOff.png","images\\ledOn.png"},147,380);

  startButton=new PushButton(new String[] {"images\\start_off.png", "images\\start_on.png"}, 1100, 370);
  stopButton=new PushButton(new String[] {"images\\stop_off.png", "images\\stop_on.png"}, 1200, 370);
  resetButton=new PushButton(new String[] {"images\\reset_off.png", "images\\reset_on.png"}, 1300, 370);
  returnButton=new PushButton(new String[] {"images\\return_off.png", "images\\return_on.png"}, 1100, 500);


  wagon=new Wagon("images\\hookTop.png", 900, 100);
  hook=new Hook("images\\hookBottom.png", 900, 140);
  hook.attach(wagon);

  leftSensor=new HorizontalPositionSensor(new String[] {"images\\ledOff.png", "images\\ledOn.png"}, 95, 19);
  leftSensor.attatch(wagon);

  middleSensor=new HorizontalPositionSensor(new String[] {"images\\ledOff.png", "images\\ledOn.png"}, 512, 19);
  middleSensor.attatch(wagon);

  rightSensor=new HorizontalPositionSensor(new String[] {"images\\ledOff.png", "images\\ledOn.png"}, 929, 19);
  rightSensor.attatch(wagon);


  upSensor=new VerticalPositionSensor(new String[] {"images\\ledOff.png", "images\\ledOn.png"}, 985, 157, 140, 170);
  upSensor.attatch(hook);

  downSensor=new VerticalPositionSensor(new String[] {"images\\ledOff.png", "images\\ledOn.png"}, 985, 393, 370, 400);
  downSensor.attatch(hook);
  
  
  dirtyBox=new Box("images\\dirtyBox.png",900,520);
  dirtyBox.attach(hook);
  
  cleanBox=new Box("images\\dirtyBox.png",900,520);
  cleanBox.attach(hook);
  cleanBox.visible=false;
  
  plc=new Plc("images\\plc.png", 1100, 0);
  new Thread (wagon).start(); 
  new Thread (hook).start(); 
  new Thread (leftSensor).start();
  new Thread (middleSensor).start();
  new Thread (rightSensor).start();
  new Thread (upSensor).start();
  new Thread (downSensor).start();
}



//***************************************************************************
// simulation du bornier de connexion
void  actorsToPlc(boolean inputs[]) {
  inputs[0]=startButton.state;
}

// simulation du bornier de connexion
void   plcToActors(boolean outputs[]) {
  hook.down=outputs[0];
  wagon.left=stopButton.state;
  
}


void draw() {
  plc.run();

  background(200);
  plant.draw();
  plc.draw();

  startButton.draw();
  stopButton.draw();
  resetButton.draw();
  returnButton.draw();

  leftSensor.draw();
  middleSensor.draw();
  rightSensor.draw();
  upSensor.draw();
  downSensor.draw();
  wagon.draw();
  hook.draw();
  dirtyBox.draw();
  cleanBox.draw();
  
  // draw cleaning Tank
  fill(color(100,100,100));
  rect(400,450,200,150);
  //  endLight.draw();
  //  mixerIndicator.draw();
}

void mouseClicked() {
}

void mousePressed() {
  startButton.mousePressed();
  stopButton.mousePressed();
  resetButton.mousePressed();
  returnButton.mousePressed();
}

void mouseReleased() {
  startButton.mouseReleased();
  stopButton.mouseReleased();
  resetButton.mouseReleased();
  returnButton.mouseReleased();
}