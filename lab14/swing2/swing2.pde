
// déclaration de deux fenêtres
simpleFrame a;

void setup() {
  a=new simpleFrame("Fenêtre swing"); //la première fenêtre avec son titre et provoquant l'arrêt du programme à sa fermeture
  
  a.setLocation(200,200);

  noLoop(); // pas d'appel de draw en boucle, on n'a rien à dessiner
}


void draw(){

}


void exit() {
  println("Application terminée en cliquant sur le coin supérieur droit de la fenêtre graphique de processing");
  super.exit();
}