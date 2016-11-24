// fichier contenant toutes les fonctions créées pour modifier une image

/***********************************************************************************************/
// fonction permettant de placer une image redimensionnée en x et y 
void drawImage(PImage img,float echelle,int x, int y){
  pushMatrix(); // sauvegarde de la matrice de transformation par défaut de l'image
  scale(echelle);   // toutes les coordonnées et dimensions sont divisées par echelle
  image(img,x/echelle,y/echelle); // dessin de l'image en x,y  soit x/echelle et y/echelle
  popMatrix(); // restauration de la matrice de transformation par défaut
}

/***********************************************************************************************/
// fonction permettant de placer une image redimensionnée en x et y 
void drawImage(PImage img,float echelle,float rotation,int x, int y){
  float angle=rotation/180.0*PI;
  pushMatrix(); // sauvegarde de la matrice de transformation par défaut de l'image
  scale(echelle);   // toutes les coordonnées et dimensions sont divisées par echelle
  translate(x/echelle,y/echelle);  // déplacer au centre de l'image
  rotate(angle); // rotation d'un angle en radian
  image(img,-img.height/2/echelle,-img.width/2/echelle); // dessin de l'image 
  popMatrix(); // restauration de la matrice de transformation par défaut
}