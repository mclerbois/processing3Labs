

simpleFrame a,b;

void setup(){
  a=new simpleFrame("Première fenêtre swing contenant une fenêtre graphique processing",true); //la première fenêtre avec son titre et provoquant l'arrêt du programme à sa fermeture  
  b=new simpleFrame("Deuxième fenêtre swing contenant une fenêtre graphique processing",false);
  a.setLocation(200,200);
  b.setLocation(500,200);
}

void draw(){
   background(0);
    ellipse(mouseX, mouseY, 20, 20);
}