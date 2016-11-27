

void setup(){
  size(400,400);
}

void draw() {
  background(0);
  stroke(255);
  drawHorizontalAxe(10,360,350,2,5,3,2);
  drawVerticalAxe(10,360,350,2,5,3,2);
}

/*
  x0,y0 coordonnées de l'origine de l'axe
  L longueur de l'axe
  npgrad nombre de graduations principales
  hpgrad hauteur en pixels d'une graduation principale
  nsgrad nombre de graduations secondaires
  hsgrad hauteur en pixels d'une graduation secondaire
*/

void drawHorizontalAxe(int x0,int y0, int L,int npgrad, int hpgrad, int nsgrad,int spgrad)
{
  int x;
  line(x0,y0,x0+L,y0);
  for (int i=0;i<npgrad;i++) {
    x=x0+(L*i)/npgrad;
    line (x,y0-hpgrad,x,y0+hpgrad);
    for(int j=1;j<nsgrad;j++){
      x=x0+(L*i)/npgrad+(L*j)/npgrad/nsgrad;
      line (x,y0-spgrad,x,y0+spgrad);
      }
    }
  line (x0+L,y0-hpgrad,x0+L,y0+hpgrad);
}

void drawVerticalAxe(int x0,int y0, int H,int npgrad, int hpgrad, int nsgrad,int spgrad)
{
  // En vous inspirant de la fonction de tracé de l'axe horizontal, ajouter le code pour l'axe vertical.
  // Attention le 0,0 de la fenêtre graphique est dans le coin supérieur droit
  
  
}