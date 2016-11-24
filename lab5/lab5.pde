// Dessiner une image
// Les fichiers images aux formats PNG se trouve dans le dossier data.

// Déclarer une variable mémorisant une image
PImage swOnA,swOffA,swOnB,swOffB;

boolean swStateA,swStateB;

ledClass greenLedA,greenLedB;

// fonction exécutée une fois
// initialisation des variables +  ...
void setup(){
  size(400,400); // dimension de la fenêtre
  swOnA=loadImage("swOn.png");
  swOffA=loadImage("swOff.png");
  swOnB=loadImage("swOn.png");
  swOffB=loadImage("swOff.png");
  
  greenLedA=new ledClass("ledGreenOff8.png","ledGreenOn8.png");
  greenLedB=new ledClass("ledGreenOff8.png","ledGreenOn8.png");
  
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
  
  greenLedA.change(swStateA && swStateB);
  greenLedA.draw(250,100);
  
  greenLedB.change(swStateA || swStateB);
  greenLedB.draw(280,100);
  
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