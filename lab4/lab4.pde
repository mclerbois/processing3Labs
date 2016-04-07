
/*
*  Quatrième exemple de programme
*  M. Clerbois 
*  4 novembre 2015
*  Rev 1.0
*/

/* Déclaration de constantes */
final color myBackGroundColor=color(99,161,215);

final int windowWidth=100;      // deux variables pour la dimension de la fenêtre
final int windowHeight=100;

final long  waitTime=500; // millisecondes

// déclaration de deux variables pour mémoriser deux images
PImage ledOff,ledOn;

// procédure appellée une fois avant setup, utilisée pour définir la taille de la fenêtre
// ajouté à la version 3 de processing
void settings()
{
  size(windowWidth,windowHeight); // la dimension de la fenêtre doit être définie par des valeurs numériques ou des variables
}


boolean ledState=false;
long actualTime;


// procédure appellée une fois au démarrage du programme
void setup()
{
  ledOff=loadImage("images/ledRedOff.gif");
  ledOn=loadImage("images/ledRedOn.gif");
  actualTime=millis();
  println("Setup done");          // message affiché dans la console
}



// procédure appellée dans la boucle principale (cachée) du programme
void draw()
{
  if ((millis()-actualTime)> waitTime) {
    actualTime=millis();
    ledState=! ledState;
    }
  
  background(myBackGroundColor); // couleur d'arrière plan de la fenêtre, efface l'ancienne image.
  if (ledState) 
    image(ledOn,5,5);
  else
    image(ledOff,5,5);
}