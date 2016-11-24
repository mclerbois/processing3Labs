// Dessiner une image
// Les fichiers images aux formats PNG se trouve dans le dossier data.

// Déclarer une variable mémorisant une image
PImage swOnA,swOffA,swOnB,swOffB,ledGreenOn4,ledGreenOff4;

boolean ledState;
boolean swStateA,swStateB;

// fonction exécutée une fois
// initialisation des variables +  ...
void setup(){
  size(400,400); // dimension de la fenêtre
  swOnA=loadImage("swOn.png");
  swOffA=loadImage("swOff.png");
  swOnB=loadImage("swOn.png");
  swOffB=loadImage("swOff.png");
  ledGreenOn4=loadImage("ledGreenOn4.png");
  ledGreenOff4=loadImage("ledGreenOff4.png");
  ledState=false;
  swStateA=false;
  swStateB=false;
}

// fonction exécutée dans une boucle
// dessin de l'écran
void draw(){
  background(200); // couleur du fond de la fenêtre
  
  if (swStateA)
    image(swOnA,10,10); // dessin de l'image échelle 1 sur 1
  else
    image(swOffA,10,10); // dessin de l'image échelle 1 sur 1

  if (swStateB)
    image(swOnB,110,10); // dessin de l'image échelle 1 sur 1
  else
    image(swOffB,110,10); // dessin de l'image échelle 1 sur 1    
  
  ledState= swStateA && swStateB;
  
  if (ledState)
    image(ledGreenOn4,220,20); // dessin de l'image échelle 1 sur 1
  else
    image(ledGreenOff4,220,20); // dessin de l'image échelle 1 sur 1
 
}

void mouseClicked()
{
  // on agit sur le premier switch si ...
  if ( (mouseX>10) && (mouseX<(10+swOnA.width)) && (mouseY>10) && (mouseY<(10+swOnA.height)) )
    swStateA=!swStateA;

  // on agit sur le premier switch si ...
  if ( (mouseX>110) && (mouseX<(110+swOnB.width)) && (mouseY>10) && (mouseY<(10+swOnB.height)) )
    swStateB=!swStateB;
}