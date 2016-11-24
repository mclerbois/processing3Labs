

// Exécution de zone de code en multitâche (//)


shortApp a,b; // deux tâches supplémentaires fonctionnant en // de celle de dessin de l'écran


void setup(){
  size(150,500);
  
  a=new shortApp("A",450);      // Cette tâche fonctionnera durant environ 450*10mSec, 4.5Sec
  b=new shortApp("B",350);      // Cette tâche fonctionnera durant environ 350*10mSec, 3.5Sec 
  
  registerMethod("pre", this);  // définition d'une méthode exécuté avant chaque draw
}

// on dessine deux cercles
void draw() {
  background(200);
  ellipse(30,500-a.py,20,20); // on dessine un cercle avec comme ordonnée une valeur fournie par la tâche A
  ellipse(60,500-b.py,20,20); // on dessine un cercle avec comme ordonnée une valeur fournie par la tâche B
}

// Exécuté avant chaque draw
void pre() {
  if (!a.isAlive() && !b.isAlive()) { // si les deux tâches sont terminées
     println("ReStart Both");  // on les redémarre toutes les deux
     a=new shortApp("A",450);  
     b=new shortApp("B",350);
    }
}