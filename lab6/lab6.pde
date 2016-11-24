// Dessiner une image
// Les fichiers images aux formats PNG se trouve dans le dossier data.

ledClass greenLedA,greenLedB;
switchClass swA,swB;

// fonction exécutée une fois
// initialisation des variables +  ...
void setup(){
  size(400,400); // dimension de la fenêtre
  
  greenLedA=new ledClass("ledGreenOff8.png","ledGreenOn8.png");
  greenLedB=new ledClass("ledGreenOff8.png","ledGreenOn8.png");
  
  swA= ...
  swB= ...
  
}

// fonction exécutée dans une boucle
// dessin de l'écran
void draw(){
  background(200); // couleur du fond de la fenêtre
  
  swA.draw(10,10);
  swB.draw(110,10); 
  
  greenLedA.change(swStateA && swStateB);
  greenLedA.draw(250,100);
  
  greenLedB.change(swStateA || swStateB);
  greenLedB.draw(280,100);
  
}

void mouseClicked()
{
  // on agit sur le premier switch si ...
  //if ( (mouseX>110) && (mouseX<(110+swOnB.width)) && (mouseY>10) && (mouseY<(10+swOnB.height)) )
  //  swStateB=!swStateB;
  
  if (swA.onMouseClicked()) return ;
  SwB.onMouseClicked();
}