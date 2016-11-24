// Dessiner une image
// Les fichiers images aux formats PNG se trouve dans le dossier data.

// Déclarer une variable mémorisant une image
PImage ledGreenOn;

// fonction exécutée une fois
// initialisation des variables +  ...
void setup(){
  size(400,400); // dimension de la fenêtre
  ledGreenOn=loadImage("ledGreenOn.png");
}

// fonction exécutée dans une boucle
// dessin de l'écran
void draw(){
  background(200); // couleur du fond de la fenêtre
  image(ledGreenOn,0,0); // dessin de l'image échelle 1 sur 1
  
  pushMatrix(); // sauvegarde de la matrice de transformation par défaut de l'image
  scale(0.25);   // toutes les coordonnées et dimensions sont divisées par 4
  image(ledGreenOn,800,800); // dessin de l'image en 200,200 200=800/4
  popMatrix(); // restauration de la matrice de transformation par défaut
  drawImage(ledGreenOn,0.125,300,300); // dessin de l'image à l'échelle 1/8
}

// fonction permettant de placer une image redimensionnée en x et y 
void drawImage(PImage img,float echelle,int x, int y){
  pushMatrix(); // sauvegarde de la matrice de transformation par défaut de l'image
  scale(echelle);   // toutes les coordonnées et dimensions sont divisées par echelle
  image(img,x/echelle,y/echelle); // dessin de l'image en x,y  soit x/echelle et y/echell
  popMatrix(); // restauration de la matrice de transformation par défaut
}