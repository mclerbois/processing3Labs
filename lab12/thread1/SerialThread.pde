


// objet simulant le traitement dans une tâche de fond des données reçues par une liaison série ou la carte réseau
public class serialThread extends Thread {
  
  private int data=0;
  private PApplet parent; // permet à l'objet d'avoir accès aux fonctions draw et exit

  // Constructeur
  public serialThread(PApplet parent) {
    this.parent=parent;
    }
  
  // Traitement des données, zone critique, la variable data est  testée et modifiée dans deux fonctions et deux tâches, danger
  public synchronized void get() throws InterruptedException {
    while (data==0) { // S'il n'y a pas de données
      wait();         // on attend un donnée
    }

    println("Do a get, retrieve data for treatement");
    data--; // une donnée en moins à traiter
    parent.draw(); // on redessine l'écran car quelque chose a changé
  }
 
  // Traitement des données, zone critique, la variable data est  testée et modifiée dans deux fonctions et deux tâches, danger
  // fonction appelée lors de la réception d'une donnée, d'un événement
  public synchronized void put() throws InterruptedException {
    println("Do a put, add data for treatement");
    data++; // on mémorise l'évenemment (les données reçues à traiter)
    //if (data>4) // si le nombre de donnée à traiter est supérieure à 4, un exemple
      notify();   // awake thread to run (provoque un get() avec data>0)
  }
 
  // function run == boucle principale de la tâche de fond
  public void run() {
    for (;; ) {     // boucle sans fin
      try {
        get();      // réalise le traitement des données dans une boucle sans fin, s'il y a des données à traiter
      }
      catch (InterruptedException e) { // en cas d'arrêt de la tâche
        print("In run ");
        println(e);
        parent.exit();   // arrêt de l'application
      }
    }
  }
}