
/*
*  Sixième exemple de programme
*  M. Clerbois 
*  4 novembre 2015
*  Rev 1.0
*/

/* Déclaration de constantes */
final color myBackGroundColor=color(99,161,215);

final int windowWidth=100;      // deux variables pour la dimension de la fenêtre
final int windowHeight=100;

 long  waitTime=500; // millisecondes

// déclaration de deux variables pour mémoriser leds
twoStateImage redLed,greenLed;

twoStateImage vanne;

// déclaration d'une variable pour le switch
_switch mySwitch;


// procédure appellée une fois avant setup, utilisée pour définir la taille de la fenêtre
// ajouté à la version 3 de processing
void settings()
{
  size(windowWidth,windowHeight); // la dimension de la fenêtre doit être définie par des valeurs numériques ou des variables
  
}

long actualTime;


// procédure appellée une fois au démarrage du programme
void setup()
{
  redLed= new twoStateImage("images/ledRedOff.gif","images/ledRedOn.gif");
  redLed.locate(5,5);
  redLed.on();
  
  greenLed= new twoStateImage("images/ledGreenOff.gif","images/ledGreenOn.gif");
  greenLed.locate(25,5);
  greenLed.off();
  
  vanne=new twoStateImage("images/closeValve.png","images/openValve.png", 10,35);
  
  mySwitch=new _switch("images/SchalterDown.png","images/SchalterUp.png",50,5);
  
  actualTime=millis();
  println("Setup done");          // message affiché dans la console
}


// procédure appellée dans la boucle principale (cachée) du programme
void draw()
{
  if ((millis()-actualTime)> waitTime) {
    actualTime=millis();
    redLed.toggle();
    greenLed.toggle();
    
    }
  if (mySwitch.get())
    waitTime=250;
  else
    waitTime=500;
    
  background(myBackGroundColor); // couleur d'arrière plan de la fenêtre, efface l'ancienne image.
  redLed.draw();
  greenLed.draw();
  mySwitch.draw();
  vanne.draw();
}

void mousePressed() {
  if (mySwitch.isMouseOver(mouseX,mouseY)){
    mySwitch.on();
    vanne.toggle();
    }
  }

void mouseReleased() {
     if (mySwitch.isMouseOver(mouseX,mouseY))
       mySwitch.off();
}