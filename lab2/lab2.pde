// Dessiner une image
// Les fichiers images aux formats PNG se trouve dans le dossier data.

// Déclarer une variable mémorisant une image
PImage swOn;

// fonction exécutée une fois
// initialisation des variables +  ...
void setup(){
  size(400,400); // dimension de la fenêtre
  swOn=loadImage("swOn.png");
}

// fonction exécutée dans une boucle
// dessin de l'écran
void draw(){
  background(200); // couleur du fond de la fenêtre
  image(swOn,0,0); // dessin de l'image échelle 1 sur 1
  
  drawImage(swOn,1.0,90,300,200); // echelle 1, rotation 90°, coordonnée du centre de l'image
}