
/*
*  Cinquième exemple de programme
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
led redLed;

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
  redLed= new led("images/ledRedOff.gif","images/ledRedOn.gif");
  redLed.locate(5,5);
  redLed.set();
  actualTime=millis();
  println("Setup done");          // message affiché dans la console
}



// procédure appellée dans la boucle principale (cachée) du programme
void draw()
{
  if ((millis()-actualTime)> waitTime) {
    actualTime=millis();
    redLed.toggle();
    }
  
  background(myBackGroundColor); // couleur d'arrière plan de la fenêtre, efface l'ancienne image.
  redLed.draw();
}