// Dessiner une image
// Les fichiers images aux formats PNG se trouve dans le dossier data.

// Déclarer une variable mémorisant une image
PImage swOn,swOff,ledGreenOn4,ledGreenOff4;

boolean ledState;
boolean swState;

// fonction exécutée une fois
// initialisation des variables +  ...
void setup(){
  frameRate(30);
  size(400,400); // dimension de la fenêtre
  swOn=loadImage("swOn.png");
  swOff=loadImage("swOff.png");
  ledGreenOn4=loadImage("ledGreenOn4.png");
  ledGreenOff4=loadImage("ledGreenOff4.png");
  ledState=false;
  swState=false;
}

// fonction exécutée dans une boucle
// dessin de l'écran
void draw(){
  background(200); // couleur du fond de la fenêtre
  
  if (swState)
    image(swOn,0,0); // dessin de l'image échelle 1 sur 1
  else
    image(swOff,0,0); // dessin de l'image échelle 1 sur 1
    
  if (ledState)
    image(ledGreenOn4,220,20); // dessin de l'image échelle 1 sur 1
  else
    image(ledGreenOff4,220,20); // dessin de l'image échelle 1 sur 1
    
  if (frameCount%30==0)
    ledState= ! ledState;
    
  if (frameCount%50==0)
    swState= ! swState;
}