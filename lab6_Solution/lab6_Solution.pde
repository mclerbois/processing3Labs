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
  
  swA= new switchClass("swOff.png","swOn.png");
  swB= new switchClass("swOff.png","swOn.png");
  
}

// fonction exécutée dans une boucle
// dessin de l'écran
void draw(){
  background(200); // couleur du fond de la fenêtre
  
  swA.draw(10,10);
  swB.draw(110,10); 
  
  greenLedA.change(swA.state() && swB.state());
  greenLedA.draw(250,100);
  
  greenLedB.change(swA.state() || swB.state());
  greenLedB.draw(280,100);
  
}

void mouseClicked()
{
  if (swA.OnMouseClicked()) return;
  swB.OnMouseClicked();
}