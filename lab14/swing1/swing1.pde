
// déclaration de deux fenêtres
simpleFrame a,b;

void setup() {
  a=new simpleFrame("Première fenêtre swing",true); //la première fenêtre avec son titre et provoquant l'arrêt du programme à sa fermeture
  b=new simpleFrame("Deuxième fenêtre swing",false);//l'autre fenêtre avec son titre ne provoquant pas l'arrêt du programme à sa fermeture 
  
  a.setLocation(200,200);
  b.setLocation(500,200);

  a.requestFocus(); // a sera la fenêtre active

  noLoop(); // pas d'appel de draw en boucle, on n'a rien à dessiner
}


void draw(){

}

void mouseClicked(){
 if (!b.isVisible())  // si la fenêtre b n'est pas visible
   b.show();          // la rendre visible
 else
   b.hide();          // sinon la cacher
}

void exit() {
  println("Application terminée en cliquant sur le coin supérieur droit de la fenêtre graphique de processing");
  super.exit();
}