

// L'application processing produit des données, le thread a consomme ces données.

//  tâche de traitement de données 
serialThread a;


void setup() {
  size(100,100);
  a=new serialThread(this); // Créer une nouvelle tâche de fond (daemon)
  a.start();                // démarre la tâche
  noLoop();                 // n'autorise pas la fonction draw de fonctionner dans une boucle
  println("Click dans la zone grisée pour simuler la réception d'une donnée");
  println("Click dans la zone rouge pour simuler la demande d'arrêt de l'application");
}

// Draw est exécuté une première fois, ensuite chaque fois que l'on clique dans la zone grisée
void draw() {
    background(200);
    fill(color(255,0,0));
    rect(50,0,50,100);
    println("Do a Draw");
    }

// mouseClicked est utilisé pour simuler l'arrivée d'un packet de données à traiter
void mouseClicked() {
    try {
      if (mouseX>50)   // si on clique dans la zone rouge
        a.interrupt(); // arrêt de la tâche, durant la phase d'arrêt, la tâche provoque l'arrêt du programme 
      else
        a.put();       // signal l'événement à la tâche a, réception d'un caractère.
    }
    catch (InterruptedException e) {
      println(e);
      exit();
    }
}